def parseinput():
    # This function is to parse the initial input into a usable form
    with open("input.dat") as file:
        input = file.readlines()
        newarr = []
        for line in input:
            newarr.append(line.strip())
    return newarr


MAX_COLOURS = [12, 13, 14]


def part1(inpt):
    count = 0
    for line in inpt:
        line = line.split(":")
        result = checkgamepart1(line[1])
        if result == 1:
            count += getID(line[0])

    return count


def part2(inpt):
    count = 0
    for line in inpt:
        line = line.split(":")
        result = checkgamepart2((line[1]))
        count += result
    return count


def checkgamepart1(game):
    game = game.split(";")

    for i in range(len(game)):
        round = game[i]
        round = round.split(",")

        localcolours = [0, 0, 0]
        for item in round:
            item = item.strip().split(" ")
            item[0] = int(item[0])

            coloursdict = {"r": 0,
                           "g": 1,
                           "b": 2}
            localcolours[coloursdict[item[1][0]]] += item[0]

        for i in range(len(localcolours)):
            if localcolours[i]> MAX_COLOURS[i]:
                return 0
    return 1


def checkgamepart2(game):
    game = game.split(";")

    localcolours = [0, 0, 0]
    for i in range(len(game)):
        round = game[i]
        round = round.split(",")

        for item in round:
            item = item.strip().split(" ")
            item[0] = int(item[0])
            coloursdict = {"r": 0,
                           "g": 1,
                           "b": 2}
            localcolours[coloursdict[item[1][0]]] = max(localcolours[coloursdict[item[1][0]]], item[0])
    return localcolours[0]*localcolours[1]*localcolours[2]


def getID(str):
    str = str.split(" ")
    return int(str[1])


if __name__ == "__main__":
    # Always runs, where the script runs the functions.
    print(f"Part 1: {part1(parseinput())}")
    print(f"Part 2: {part2(parseinput())}")
    pass