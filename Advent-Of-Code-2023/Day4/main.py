import math
def parseinput():
    # This function is to parse the initial input into a usable form
    with open("input.dat") as file:
        inp = file.readlines()
        file.close()
    return inp

def part1(inp):
    count = 0
    for line in inp:
        line = line.split(":")[1].strip()
        parts = line.split("|")
        parts[1] = parts[1].split(" ")
        parts[0] = parts[0].split(" ")
        amountfound = 0
        for num in parts[1]:
            num = num.replace(" ","")
            if num.strip() in parts[0] and num.isnumeric():
                amountfound += 1
        if amountfound != 0:
            count += math.pow(2,amountfound-1)
    return int(count)

def part2(inp):
    for i in range(len(inp)):
        inp[i] = [1, inp[i]]
    for i in range(len(inp)):
        inp[i][1] = inp[i][1].split(":")[1].strip()
        parts = inp[i][1].split("|")
        parts[0] = parts[0].split(" ")
        parts[1] = parts[1].split(" ")
        amountfound = 0
        for num in parts[1]:
            num = num.replace(" ", "")
            if num.strip() in parts[0] and num.isnumeric():
                amountfound += 1
        for j in range(1,amountfound+1,1):
            inp[i+j][0] += inp[i][0]
    count = 0
    for i in range(len(inp)):
        count += inp[i][0]
    return count

if __name__ == "__main__":
    # Always runs, where the script runs the functions.
    print(part1(parseinput()))
    print(part2(parseinput()))
    pass