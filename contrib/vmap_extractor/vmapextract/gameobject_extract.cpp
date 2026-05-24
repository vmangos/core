#include "model.h"
#include "dbcfile.h"
#include "wmo.h"
#include "vmapexport.h"
#include "libmpq/mpq_libmpq.h"

#include <algorithm>
#include <stdio.h>

// Check if file exists in MPQ without adding to failedPaths
static bool MPQFileExists(const std::string& path)
{
    MPQFile f(path.c_str());
    bool exists = !f.isEof();
    f.close();
    return exists;
}

bool ExtractSingleModel(std::string& origPath, std::string& fixedName, StringSet& failedPaths)
{
    if (origPath.length() < 4)
        return false;

    std::string extension = GetExtension(GetPlainName(origPath.c_str()));

    // < 3.1.0 ADT MMDX section store filename.mdx filenames for corresponded .m2 file
    if (extension == ".mdx" || extension == ".MDX" || extension == ".mdl" || extension == ".MDL")
    {
        // replace .mdx -> .m2
        origPath.erase(origPath.length() - 2, 2);
        origPath.append("2");
    }
    // >= 3.1.0 ADT MMDX section store filename.m2 filenames for corresponded .m2 file
    // nothing do

    std::string originalPath = origPath;

    char* name = GetPlainName((char*)origPath.c_str());
    FixNameCase(name, strlen(name));
    FixNameSpaces(name, strlen(name));
    fixedName = name;

    std::string output = std::string(szWorkDirWmo) + "/" + name;
    if (FileExists(output.c_str()))
        return true;

    // Try 1: Path with underscores
    Model mdl(origPath);
    if (mdl.open(failedPaths))
        return mdl.ConvertToVMAPModel(output.c_str());

    // Try 2: Original path (with spaces if it had them)
    if (originalPath != origPath && MPQFileExists(originalPath))
    {
        failedPaths.erase(origPath);
        Model mdl2(originalPath);
        if (mdl2.open(failedPaths))
            return mdl2.ConvertToVMAPModel(output.c_str());
    }

    // Try 3: Filename with underscores converted to spaces
    size_t lastSlash = origPath.find_last_of("\\/");
    if (lastSlash != std::string::npos)
    {
        std::string altPath = origPath;
        std::replace(altPath.begin() + lastSlash + 1, altPath.end(), '_', ' ');
        if (altPath != origPath && altPath != originalPath && MPQFileExists(altPath))
        {
            failedPaths.erase(origPath);
            Model mdl3(altPath);
            if (mdl3.open(failedPaths))
                return mdl3.ConvertToVMAPModel(output.c_str());
        }
    }

    return false;
}

bool ExtractGameobjectModels()
{
    printf("\n");
    printf("Extracting GameObject models...\n");
    DBCFile dbc("DBFilesClient\\GameObjectDisplayInfo.dbc");
    if (!dbc.open())
    {
        printf("Fatal error: Invalid GameObjectDisplayInfo.dbc file format!\n");
        exit(1);
    }

    std::string basepath = szWorkDirWmo;
    basepath += "/";
    std::string path;
    StringSet failedPaths;

    FILE* model_list = fopen((basepath + "temp_gameobject_models").c_str(), "wb");

    for (DBCFile::Iterator it = dbc.begin(); it != dbc.end(); ++it)
    {
        path = it->getString(1);

        if (path.length() < 4)
            continue;

        FixNameCase((char*)path.c_str(), path.size());
        char* name = GetPlainName((char*)path.c_str());

        char const* ch_ext = GetExtension(name);
        if (!ch_ext)
            continue;

        bool result = false;
        std::string fixedName;

        if (!strcmp(ch_ext, ".wmo"))
        {
            result = ExtractSingleWmo(path);
            if (result)
                FixNameSpaces(name, strlen(name));
        }
        else if (!strcmp(ch_ext, ".mdl"))
        {
            continue;
        }
        else
        {
            result = ExtractSingleModel(path, fixedName, failedPaths);
            if (result)
                name = (char*)fixedName.c_str();
        }

        if (result)
        {
            uint32 displayId = it->getUInt(0);
            uint32 path_length = strlen(name);
            fwrite(&displayId, sizeof(uint32), 1, model_list);
            fwrite(&path_length, sizeof(uint32), 1, model_list);
            fwrite(name, sizeof(char), path_length, model_list);
        }
    }

    fclose(model_list);

    if (!failedPaths.empty())
    {
        printf("Warning: Some models could not be extracted, see below\n");
        for (StringSet::const_iterator itr = failedPaths.begin(); itr != failedPaths.end(); ++itr)
            printf("Could not find file of model %s\n", itr->c_str());
        printf("Done!\n");
        return false;
    }

    printf("Done!\n");
    return true;
}
