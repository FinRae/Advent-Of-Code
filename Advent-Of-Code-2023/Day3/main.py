
# BEFORE READING THIS CODE PLEASE KNOW I WAS VERY TIRED AND WROTE SHITE LOOKING CODE (SORRY)

def parseinput():
    # This function is to parse the initial input into a usable form
    with open("input.dat") as file:
        input = file.readlines()
        newarr = []
        for line in input:
            newarr.append(line.strip())
    return newarr

NotSymbols = [".","0","1","2","3","4","5","6","7","8","9"]

def task1(inpt):
    count = 0
    for i in range(len(inpt)):
        for j in range(len(inpt[i])):
            if inpt[i][j] not in NotSymbols:
                emptylist = True
                while emptylist:
                    adjacentnums = searchadjacent(inpt, i, j)
                    for pos in adjacentnums:
                        returnedarr = findnumber(inpt, pos[0], pos[1])
                        count += returnedarr[2]
                        for k in range(returnedarr[1]-returnedarr[0] +1):
                            splitstring = list(inpt[pos[0]])
                            splitstring[returnedarr[0]+k] = "."
                            inpt[pos[0]] = "".join(splitstring)

                        break
                    if not searchadjacent(inpt, i, j):
                        emptylist = False
    return count

def task2(inpt):
    count = 0
    for i in range(len(inpt)):
        for j in range(len(inpt[i])):
            if inpt[i][j] == "*":
                emptylist = True
                adjacentvalues = []
                while emptylist:
                    adjacentnums = searchadjacent(inpt, i, j)
                    for pos in adjacentnums:
                        returnedarr = findnumber(inpt, pos[0], pos[1])
                        adjacentvalues.append(returnedarr[2])
                        for k in range(returnedarr[1]-returnedarr[0] +1):
                            splitstring = list(inpt[pos[0]])
                            splitstring[returnedarr[0]+k] = "."
                            inpt[pos[0]] = "".join(splitstring)

                        break
                    if not searchadjacent(inpt, i, j):
                        emptylist = False

                if len(adjacentvalues) == 2:
                    count += adjacentvalues[0]*adjacentvalues[1]
    return count

def searchadjacent(inpt, line, i):
    foundindexes = []

    for y in range(-1,2,1):
        for x in range(-1,2,1):
            if inpt[line+y][i+x].isnumeric():
                foundindexes.append([line+y,i+x])
    return foundindexes

def findnumber(inpt,line,i):
    minIter = 0
    maxIter = 0
    value = ""
    while inpt[line][i].isnumeric():
        if inpt[line][i-1].isnumeric():
            i-=1
        else:
            minIter = i
            maxIter = i
            if inpt[line][i+1].isnumeric():
                maxIter = i+1
                if inpt[line][i+2].isnumeric():
                    maxIter = i+2
                    value = int(inpt[line][i] + inpt[line][i+1] + inpt[line][i + 2])
                    break
                value = int(inpt[line][i]+inpt[line][i+1])
                break
            value = int(inpt[line][i])
            break
    returnarr = [minIter,maxIter,value]
    return returnarr

if __name__ == "__main__":
    # Always runs, where the script runs the functions.
    print(task1(parseinput()))
    print(task2(parseinput()))
    pass