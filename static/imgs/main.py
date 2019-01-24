import os
arr = os.listdir()
i = 0
for file in arr:
    if ".png" in file:
        os.rename(file ,str(i)+".png")
        i += 1
