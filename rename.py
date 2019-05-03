import os

# path = "data\\UBI" #test data
path = "E:\\firmware\\DSR\\_DSR-500_Bx_FW3.12B101H_WW.extracted\\extracted\\1086010322\\UBI"

if __name__ == "__main__":
    dirfile = os.walk(path)

    for dirpath, dirnames, filenames in dirfile:
        for filename in filenames:
            fullpath = os.path.join(dirpath, filename)
            print(fullpath)
            try:
                with open(fullpath, "rb") as file:
                    line = file.readline()
                    print(line)
                    if b'\x37\x7A\x58\x5A' in line:
                        print("find 7z file")
                        file.close()
                        if ".7z" not in fullpath:
                            new_path = fullpath + ".7z"
                            try:
                                os.rename(fullpath, new_path)
                            except OSError as e:
                                print('Reason:', e)
                        else:
                            new_path = fullpath
                        print(new_path)
                        try:
                            os.system("7z x " + new_path + " -y -o" + dirpath)
                            print("Unzip success to %s ..." % dirpath)
                        except OSError as e:
                            print("Unzip failed to %s ..." % dirpath)
                            print('Reason:', e)
                    else:
                        print("not 7z file")
            except IOError:
                print("open file error!!!\n")