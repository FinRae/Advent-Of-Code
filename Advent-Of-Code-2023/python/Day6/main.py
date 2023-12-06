def parseinput():
    # This function is to parse the initial input into a usable form
    with open("input.dat") as file:
        inp = file.readlines()
        file.close()
    return inp


def part1(inp):
    totalcount = 1
    for i, line in enumerate(inp):
        inp[i] = list(map(int, list(filter(None, line.split(":")[1].strip().split(" ")))))
    for i,time in enumerate(inp[0]):
        recorddist = inp[1][i]
        tempcount = 0
        for j in range(time+1):
            if (j*(time-j)) > recorddist:
                tempcount += 1
        totalcount *= tempcount
    return totalcount


def part2(inp):
    for i, line in enumerate(inp):
        inp[i] = int("".join(list(filter(None, line.split(":")[1].strip().split(" ")))))
    count = 0
    for i in range(inp[0]+1):
        if (i*(inp[0]-i)) > inp[1]:
            count += 1
    return count


if __name__ == "__main__":
    # Always runs, where the script runs the functions.
    print(part1(parseinput()))
    print(part2(parseinput()))
    pass
