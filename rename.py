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
                            newpath = fullpath + ".7z"
                        print(newpath)
                        try:
                            os.rename(fullpath, newpath)
                        except OSError as e:
                            print('Reason:', e)
                    else:
                        print("not 7z file")
            except IOError:
                print("open file error!!!\n")