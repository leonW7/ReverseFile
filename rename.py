import os

# path = "data\\UBI" #test data
path = "E:\\firmware\\DSR\\_DSR-500_Bx_FW3.12B101H_WW.extracted\\extracted\\1086010322\\UBI"
#path = "E:\\IoT\\dlink\\DSR\\bin"

def unzip7z(filepath,dirpath):
    if ".7z" not in filepath:
        new_path = filepath + ".7z"
        try:
            os.rename(filepath, new_path)
        except OSError as e:
            print('Reason:', e)
            return False
    else:
        new_path = filepath
    print(new_path)
    try:
        os.system("7z x " + new_path + " -y -o" + dirpath)
        print("Unzip success to %s ..." % dirpath)
    except OSError as e:
        print("Unzip failed to %s ..." % dirpath)
        print('Reason:', e)
        return False
    return True

def unluac(filepath,dirpath):
    try:
        os.system("java -jar unluac_2015_06_13.jar " + filepath + " > " + dirpath + "tmp.lua")
        os.remove(filepath)
        os.rename(dirpath + "tmp.lua", filepath)
    except OSError as e:
        print("Unluac failed to %s ..." % dirpath)
        print('Reason:', e)
        return False
    return True

if __name__ == "__main__":
    dirfile = os.walk(path)

    for dirpath, dirnames, filenames in dirfile:
        for filename in filenames:
            fullpath = os.path.join(dirpath, filename)
            print(fullpath)
            try:
                with open(fullpath, "rb") as file:
                    line = file.readline()
                    if b'\x37\x7A\x58\x5A' in line:
                        print("find 7z file")
                        file.close()
                        unzip7z(fullpath, dirpath)
                    else:
                        print("not 7z file")
            except IOError:
                print("open file error!!!\n")

    dirfile = os.walk(path)

    for dirpath, dirnames, filenames in dirfile:
        for filename in filenames:
            fullpath = os.path.join(dirpath, filename)
            print(fullpath)
            try:
                with open(fullpath, "rb") as file:
                    line = file.readline()
                    if b'\x4C\x75\x61\x51' in line:
                        print("find LuaQ file")
                        file.close()
                        unluac(fullpath, dirpath)
                    else:
                        print("not LuaQ file")
            except IOError:
                print("open file error!!!\n")