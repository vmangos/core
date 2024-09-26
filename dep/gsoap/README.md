# gSOAP
SOAP is an older protocol that communicates over HTTP.
In MaNGOS it is used to remotely execute commands on the world server.

## How to update this

Download the latest [gSOAP Toolkit Files](https://sourceforge.net/projects/gsoap2/files/)

### Windows
1. Open a terminal in this folder
2. Execute `<gsoap-dir>/gsoap/bin/win64/soapcpp2.exe -1 -S -L -w -x -y -c++11 gsoap.stub`
3. Remove `ns1.nsmap`
4. Copy `<gsoap-dir>/gsoap/stdsoap2.h`
5. Copy `<gsoap-dir>/gsoap/stdsoap2.cpp`

### Linux
<details>
<summary>Build gSOAP on Ubuntu</summary>

```
unzip gsoap_2.8.135.zip
cd gsoap-2.8
apt install yacc flex libbison-dev
./configure
./makemake
make
```

</details>

```
cd <this-folder-in-mangos>
<gsoap-dir>/gsoap/src/soapcpp2 -1 -S -L -w -x -y -c++11 gsoap.stub
rm ns1.nsmap
cp <gsoap-dir>/gsoap/stdsoap2.h .
cp <gsoap-dir>/gsoap/stdsoap2.cpp .
```
