/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _BYTEBUFFER_H
#define _BYTEBUFFER_H

#include "Common.h"
#include "Utilities/ByteConverter.h"

class ByteBufferException
{
    public:
        ByteBufferException(bool _add, size_t _pos, size_t _esize, size_t _size)
            : add(_add), pos(_pos), esize(_esize), size(_size)
        {
            PrintPosError();
        }

        void PrintPosError() const;
    private:
        bool add;
        size_t pos;
        size_t esize;
        size_t size;
};

template<class T>
struct Unused
{
    Unused() {}
};

class ByteBuffer
{
    public:
        static size_t const DEFAULT_SIZE = 0x1000;

        // constructor
        ByteBuffer(): _rpos(0), _wpos(0)
        {
            _storage.reserve(DEFAULT_SIZE);
        }

        // constructor
        ByteBuffer(size_t res): _rpos(0), _wpos(0)
        {
            _storage.reserve(res);
        }

        // copy constructor
        ByteBuffer(ByteBuffer const& buf): _rpos(buf._rpos), _wpos(buf._wpos), _storage(buf._storage) { }

        // move constructor
        ByteBuffer(ByteBuffer&& buf) : _rpos(buf._rpos), _wpos(buf._wpos), _storage(std::move(buf._storage)) {}

        // move operator
        ByteBuffer& operator=(ByteBuffer&& rhs)
        {
            _rpos = rhs._rpos;
            _wpos = rhs._wpos;
            _storage = std::move(rhs._storage);
            return *this;
        }

        void clear()
        {
            _storage.clear();
            _rpos = _wpos = 0;
        }

        template <typename T> void put(size_t pos,T value)
        {
            EndianConvert(value);
            put(pos,(uint8*)&value,sizeof(value));
        }

        ByteBuffer& operator<<(uint8 value)
        {
            append<uint8>(value);
            return *this;
        }

        ByteBuffer& operator<<(uint16 value)
        {
            append<uint16>(value);
            return *this;
        }

        ByteBuffer& operator<<(uint32 value)
        {
            append<uint32>(value);
            return *this;
        }

        ByteBuffer& operator<<(uint64 value)
        {
            append<uint64>(value);
            return *this;
        }

#ifdef __MINGW32__
        ByteBuffer& operator<<(time_t value)
        {
            append<time_t>(value);
            return *this;
        }
#endif

        // signed as in 2e complement
        ByteBuffer& operator<<(int8 value)
        {
            append<int8>(value);
            return *this;
        }

        ByteBuffer& operator<<(int16 value)
        {
            append<int16>(value);
            return *this;
        }

        ByteBuffer& operator<<(int32 value)
        {
            append<int32>(value);
            return *this;
        }

        ByteBuffer& operator<<(int64 value)
        {
            append<int64>(value);
            return *this;
        }

        // floating points
        ByteBuffer& operator<<(float value)
        {
            append<float>(value);
            return *this;
        }

        ByteBuffer& operator<<(double value)
        {
            append<double>(value);
            return *this;
        }

        ByteBuffer& operator<<(std::string const& value)
        {
            append((uint8 const *)value.c_str(), value.length());
            append((uint8)0);
            return *this;
        }

        ByteBuffer& operator<<(char const* str)
        {
            append((uint8 const *)str, str ? strlen(str) : 0);
            append((uint8)0);
            return *this;
        }

        ByteBuffer& operator<<(bool const& val)
        {
            append((uint8 const *)&val, 1);
            return *this;
        }

        ByteBuffer& operator>>(bool& value)
        {
            value = read<char>() > 0 ? true : false;
            return *this;
        }

        ByteBuffer& operator>>(uint8& value)
        {
            value = read<uint8>();
            return *this;
        }

        ByteBuffer& operator>>(uint16& value)
        {
            value = read<uint16>();
            return *this;
        }

        ByteBuffer& operator>>(uint32& value)
        {
            value = read<uint32>();
            return *this;
        }

        ByteBuffer& operator>>(uint64& value)
        {
            value = read<uint64>();
            return *this;
        }

#ifdef __MINGW32__
        ByteBuffer& operator >> (time_t& value)
        {
            value = read<time_t>();
            return *this;
        }
#endif

        //signed as in 2e complement
        ByteBuffer& operator>>(int8& value)
        {
            value = read<int8>();
            return *this;
        }

        ByteBuffer& operator>>(int16& value)
        {
            value = read<int16>();
            return *this;
        }

        ByteBuffer& operator>>(int32& value)
        {
            value = read<int32>();
            return *this;
        }

        ByteBuffer& operator>>(int64& value)
        {
            value = read<int64>();
            return *this;
        }

        ByteBuffer& operator>>(float& value)
        {
            value = read<float>();
            return *this;
        }

        ByteBuffer& operator>>(double& value)
        {
            value = read<double>();
            return *this;
        }

        ByteBuffer& operator>>(std::string& value)
        {
            // prevent crash at wrong string format in packet
            if (_rpos < size())
            {
                size_t startPos = _rpos;

                while (_storage[_rpos] != '\0')
                {
                    _rpos++;

                    if (_rpos + sizeof(char) > size())
                        throw ByteBufferException(false, _rpos, sizeof(char), size());
                }
                value.assign((char*)(&_storage[startPos]), _rpos - startPos);
                _rpos++;
            }
            
            return *this;
        }

        template<class T>
        ByteBuffer& operator>>(Unused<T> const&)
        {
            read_skip<T>();
            return *this;
        }


        uint8 operator[](size_t pos) const
        {
            return read<uint8>(pos);
        }

        size_t rpos() const { return _rpos; }

        size_t rpos(size_t rpos_)
        {
            _rpos = rpos_;
            return _rpos;
        }

        size_t wpos() const { return _wpos; }

        size_t wpos(size_t wpos_)
        {
            _wpos = wpos_;
            return _wpos;
        }

        template<typename T>
        void read_skip() { read_skip(sizeof(T)); }

        void read_skip(size_t skip)
        {
            if(_rpos + skip > size())
                throw ByteBufferException(false, _rpos, skip, size());
            _rpos += skip;
        }

        void rfinish()
        {
            _rpos = wpos();
        }

        template <typename T> T read()
        {
            T r = read<T>(_rpos);
            _rpos += sizeof(T);
            return r;
        }

        template <typename T> T read(size_t pos) const
        {
            if(pos + sizeof(T) > size())
                throw ByteBufferException(false, pos, sizeof(T), size());

#if defined(__arm__) || defined(_M_ARM)
            // memcpy to avoid alignment issues
            T val;
            memcpy((void*)&val, (void*)&_storage[pos], sizeof(T));
#else
            T val = *((T const*)&_storage[pos]);
#endif

            EndianConvert(val);
            return val;
        }

        void read(uint8* dest, size_t len)
        {
            if(_rpos  + len > size())
                throw ByteBufferException(false, _rpos, len, size());
            memcpy(dest, &_storage[_rpos], len);
            _rpos += len;
        }

        // returns pointer to string inside the packet without copy while checking for null terminator
        char* ReadCString()
        {
            if (_rpos + sizeof(char) > size())
                throw ByteBufferException(false, _rpos, sizeof(char), size());

            char* txt = (char*)(&_storage[_rpos]);

            while (_storage[_rpos] != '\0')
            {
                _rpos++;

                if (_rpos + sizeof(char) > size())
                    throw ByteBufferException(false, _rpos, sizeof(char), size());
            }

            _rpos++;
            return txt;
        }

        void ReadCString(char*& txt, size_t& txtLen)
        {
            size_t oldPos = _rpos;
            txt = ReadCString();
            txtLen = (_rpos - oldPos) - 1; // dont count null terminator
        }

        uint64 readPackGUID()
        {
            uint64 guid = 0;
            uint8 guidmark = 0;
            (*this) >> guidmark;

            for(int i = 0; i < 8; ++i)
            {
                if(guidmark & (uint8(1) << i))
                {
                    uint8 bit;
                    (*this) >> bit;
                    guid |= (uint64(bit) << (i * 8));
                }
            }

            return guid;
        }

        uint8 const* contents() const { return &_storage[0]; }

        size_t size() const { return _storage.size(); }
        bool empty() const { return _storage.empty(); }

        void resize(size_t newsize)
        {
            _storage.resize(newsize);
            _rpos = 0;
            _wpos = size();
        }

        void reserve(size_t ressize)
        {
            if (ressize > size())
                _storage.reserve(ressize);
        }

        void append(std::string const& str)
        {
            append((uint8 const*)str.c_str(), str.size() + 1);
        }

        void append(std::vector<uint8> const& src) 
        {
            return append(src.data(), src.size());
        }

        void append(char const* src, size_t cnt)
        {
            return append((uint8 const*)src, cnt);
        }

        template<class T> void append(T const* src, size_t cnt)
        {
            return append((uint8 const*)src, cnt * sizeof(T));
        }

        void append(uint8 const* src, size_t cnt);

        void append(ByteBuffer const& buffer)
        {
            if(buffer.wpos())
                append(buffer.contents(), buffer.wpos());
        }

        void appendPackGUID(uint64 guid)
        {
            uint8 packGUID[8+1];
            packGUID[0] = 0;
            size_t size = 1;
            for (uint8 i = 0; guid != 0; ++i)
            {
                if (guid & 0xFF)
                {
                    packGUID[0] |= uint8(1 << i);
                    packGUID[size] =  uint8(guid & 0xFF);
                    ++size;
                }

                guid >>= 8;
            }

            append(packGUID, size);
        }

        void appendPackXYZ(float x, float y, float z)
        {
            uint32 packed = 0;
            packed |= ((int)(x / 0.25f) & 0x7FF);
            packed |= ((int)(y / 0.25f) & 0x7FF) << 11;
            packed |= ((int)(z / 0.25f) & 0x3FF) << 22;
            *this << packed;
        }

        void put(size_t pos, uint8 const* src, size_t cnt)
        {
            if(pos + cnt > size())
                throw ByteBufferException(true, pos, cnt, size());
            memcpy(&_storage[pos], src, cnt);
        }

        void hexlike() const;

    private:
        // limited for internal use because can "append" any unexpected type (like pointer and etc) with hard detection problem
        template <typename T> void append(T value)
        {
            EndianConvert(value);
            append((uint8*)&value, sizeof(T));
        }

    protected:
        size_t _rpos, _wpos;
        std::vector<uint8> _storage;
};

template <typename T>
inline ByteBuffer& operator<<(ByteBuffer& b, std::vector<T> const& v)
{
    b << (uint32)v.size();
    for (typename std::vector<T>::iterator i = v.begin(); i != v.end(); ++i)
    {
        b << *i;
    }
    return b;
}

template <typename T>
inline ByteBuffer& operator>>(ByteBuffer& b, std::vector<T>& v)
{
    uint32 vsize;
    b >> vsize;
    v.clear();
    while(vsize--)
    {
        T t;
        b >> t;
        v.push_back(t);
    }
    return b;
}

template <typename T>
inline ByteBuffer& operator<<(ByteBuffer& b, std::list<T> const& v)
{
    b << (uint32)v.size();
    for (typename std::list<T>::iterator i = v.begin(); i != v.end(); ++i)
    {
        b << *i;
    }
    return b;
}

template <typename T>
inline ByteBuffer& operator>>(ByteBuffer& b, std::list<T>& v)
{
    uint32 vsize;
    b >> vsize;
    v.clear();
    while(vsize--)
    {
        T t;
        b >> t;
        v.push_back(t);
    }
    return b;
}

template <typename K, typename V>
inline ByteBuffer& operator<<(ByteBuffer& b, std::map<K, V>& m)
{
    b << (uint32)m.size();
    for (typename std::map<K, V>::iterator i = m.begin(); i != m.end(); ++i)
    {
        b << i->first << i->second;
    }
    return b;
}

template <typename K, typename V>
inline ByteBuffer& operator>>(ByteBuffer& b, std::map<K, V>& m)
{
    uint32 msize;
    b >> msize;
    m.clear();
    while(msize--)
    {
        K k;
        V v;
        b >> k >> v;
        m.insert(make_pair(k, v));
    }
    return b;
}

template<>
inline void ByteBuffer::read_skip<char*>()
{
    std::string temp;
    *this >> temp;
}

template<>
inline void ByteBuffer::read_skip<char const*>()
{
    read_skip<char*>();
}

template<>
inline void ByteBuffer::read_skip<std::string>()
{
    read_skip<char*>();
}
#endif
