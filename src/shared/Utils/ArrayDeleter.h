#ifndef MANGOS_ARRAY_DELETER_H
#define MANGOS_ARRAY_DELETER_H

template< typename T >
struct array_deleter
{
    void operator ()(T const * p)
    {
        delete[] p;
    }
};

#endif // MANGOS_ARRAY_DELETER_H
