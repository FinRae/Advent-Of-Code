import pip
import re

def parseinput():
    # This function is to parse the initial input into a usable form
    #with open("input.dat") as file:
    with open("input.dat") as file:
        inp = file.read().split("\n\n")
        for i, group in enumerate(inp):
            inp[i] = group.split(":")[1].strip().split("\n")
    return inp

def part1(inp):
    queue = inp.pop(0)[0].split(" ")

    for j,cat in enumerate(inp):
        for i, item in enumerate(queue):
            for l, line in enumerate(cat):
                if isinstance(line, str):
                    cat[l] = cat[l].split(" ")

                if int(item) >= int(cat[l][1]) and int(item) < (int(cat[l][1]) + int(cat[l][2])):
                    queue[i] = int(cat[l][0]) + (int(item) - int(cat[l][1]))
                    break

            pass


    return min(queue)


def part2(inp):
    queue = inp.pop(0)[0].split(" ")
    seeds = []
    for i in range(0,len(queue),2):
        seeds.append((int(queue[i]),int(queue[i])+ int(queue[i+1])))
    for i,cat in enumerate(inp):
        for j in range(len(cat)):
            inp[i][j] = list(map(int,inp[i][j].split(" ")))
        tempSeeds = []
        while len(seeds) > 0:
            seeds1, seeds2 = seeds.pop()
            for d, s, r in inp[i]:
                overlap1 = max(seeds1, s)
                overlap2 = min(seeds2, s + r)
                if overlap1 < overlap2:
                    tempSeeds.append((overlap1 - s + d, overlap2 - s + d))
                    if overlap1 > seeds1:
                        seeds.append((seeds1,overlap1))
                    if seeds2 > overlap2:
                        seeds.append((overlap2,seeds2))
                    break
            else:
                tempSeeds.append((seeds1,seeds2))
        seeds = tempSeeds
    return min(seeds)[0]

def getnumlist(line):
    nums = line.split(" ")
    drange = []
    for i in range(int(nums[0]),int(nums[0])+int(nums[2]),1):
        drange.append(i)
    srange = []
    for i in range(int(nums[1]),int(nums[1])+int(nums[2]),1):
        srange.append(i)
    return [drange, srange]

if __name__ == "__main__":
    # Always runs, where the script runs the functions.

    print(part1(parseinput()))
    print(part2(parseinput()))

    pass


#Tips to self, use enumerate
#Use regex
