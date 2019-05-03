import os

path = "E:\\firmware\\DSR\\UBI"

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
                        un_path = new_path + "_de"
                        if not os.path.exists(un_path):
                            try:
                                os.system("7z x -r" + new_path + "-o " + un_path)
                                print("Unzip to %s ..." % un_path)
                            except OSError as e:
                                print('Reason:', e)
                    else:
                        print("not 7z file")
            except IOError:
                print("open file error!!!\n")