#include <iostream>

#define FAIL() { printf("[FAIL]\n"); return 1; }
#define OK() { printf("[OK]\n");}

typedef unsigned int uint32;
typedef unsigned short uint16;

struct Header
{
    char magic[8];
    int nVertices;
    uint32 groupsCount;
    uint32 rootWmoId, flags, groupid;
    float bbox1[3];
    float bbox2[3];
    uint32 liquidFlags;
};

struct Chuck
{
    char chuck[4];
    uint32 size;
};

struct Vertex
{
    float x, y, z;
    void FixCoord()
    {
        float tmp = z;
        z = -y;
        y = tmp;
    }
};

enum FileType
{
    FILE_BUILDING,
    FILE_VMO,
};

int main(int argc, char **argv)
{
    // Reading arguments
    printf("* Model File Reader\n");
    if (argc != 2)
    {
        printf("Usage : %s file\n", argv[0]);
        return 1;
    }
    std::string fName = std::string(argv[1]);
    FileType type = (fName.find(".vmo") == std::string::npos) ? FILE_BUILDING : FILE_VMO;

    printf("* Opening file `%s` (type `%s`)  ... ", fName.c_str(), type == FILE_BUILDING ? "building" : "vmo");
    FILE* file = fopen(fName.c_str(), "rb");
    if (!file)
        FAIL();
    OK();

    // Reading the file
    // Header BUILDING
    if (type == FILE_BUILDING)
    {
        uint32 size = sizeof(Header);
        Header header;

        printf("* Reading header (%u bytes) ... ", size);
        if (!fread(&header, size, 1, file)) {
            fclose(file);
            FAIL();
        }
        OK();

        printf("- MAGIC : `%s`\n", std::string(header.magic).substr(0, 8).c_str());
        printf("- %i vertices\n", header.nVertices);
        printf("- Box : [%f:%f:%f][%f:%f:%f]\n",
            header.bbox1[0], header.bbox1[1], header.bbox1[2],
            header.bbox2[0], header.bbox2[1], header.bbox2[2]);
    }
    else
    {
        printf("* Reading header (magic) ... ");
        char magic[8] = {0};
        if (fread(&magic, 1, 8, file) != 8) {
            fclose(file);
            FAIL();
        }
        OK();
        printf("- MAGIC : `%s`\n", std::string(magic).substr(0, 8).c_str());
    }
    uint32 branches = 0, indexes = 0, nVertices = 0, rootWmoId = 0;
    uint16 *pIndexes = NULL;
    Vertex *pVertices = NULL;
    uint32 *pBranches = NULL;

    while (true)
    {
        Chuck chk;
        printf("* Reading chuck ... ");
        if (!fread(&chk, sizeof(Chuck), 1, file))
        {
            printf("[EOF]\n");
            break;
        }
        std::string sChk = std::string(chk.chuck).substr(0, 4);
        printf("[`%s`/%u]", sChk.c_str(), chk.size);
        if (sChk == "GRP ")
        {
            if (!fread(&branches, 4, 1, file) || !fread(&indexes, 4, 1, file))
                FAIL();
            if (pBranches)
                delete[] pBranches;
            pBranches = NULL;

            if (branches > 1)
            {
                pBranches = new uint32[branches-1];
                if (fread(pBranches, 4, branches-1, file) != (branches-1))
                {
                    delete[] pBranches;
                    FAIL();
                }
            }
            OK();
            printf("- %u branches / %u indexes.\n", branches, indexes);
        }
        else if (sChk == "INDX")
        {
            // Re-read indexes count.
            if (!fread(&indexes, 4, 1, file))
                FAIL();
            if (pIndexes)
                delete[] pIndexes;

            pIndexes = new uint16[indexes];
            if (fread(pIndexes, sizeof(uint16), indexes, file) != indexes)
            {
                delete[] pIndexes;
                FAIL();
            }
            OK();
        }
        else if (sChk == "VERT")
        {
            if (!fread(&nVertices, 4, 1, file))
                FAIL();
            if (pVertices)
                delete[] pVertices;
            pVertices = new Vertex[nVertices];
            if (fread(pVertices, sizeof(Vertex), nVertices, file) != nVertices)
            {
                delete[] pVertices;
                FAIL();
            }
            OK();
        }
        else if (sChk == "WMOD")
        {
            if (!fread(&rootWmoId, 4, 1, file))
                FAIL();
            OK();
            printf("- RootWmoID = %u\n", rootWmoId);
        }
        else
        {
           printf("\n* Unknow Chuck. Skipped.\n");
           fseek(file, chk.size, SEEK_CUR);
        }
    }
    fclose(file);

    printf("* Opening out.obj ... ");
    FILE* output = fopen("out.obj", "w+");
    if (!output)
        FAIL();
    OK();

    printf("* Writing vertices ... ");
    for (uint32 i = 0; i < nVertices; ++i)
    {
        pVertices[i].FixCoord();
        fprintf(output, "v %f %f %f\n", pVertices[i].x, pVertices[i].y, pVertices[i].z);
    }
    OK();

    printf("* Writing triangles definition ... ");
    for (uint32 i = 0; i < (indexes-2); i += 3)
        fprintf(output, "f %u %u %u\n", pIndexes[i]+1, pIndexes[i+1]+1, pIndexes[i+2]+1);
    OK();
    fclose(output);

    return 0;
}
