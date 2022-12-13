def parseinput():
    commands = []
    with open("Day10.txt") as file:
        lines = file.readlines()
    for line in lines:
        command = line.strip("\n").split(" ")
        commands.append(command)
    return commands


def addxFunc(cycle, X, amount):
    tempCycles = []
    for i in range(2):
        cycle += 1
        if i == 1:
            X += amount
        tempCycles.append([cycle, X])
    return cycle, X , tempCycles


def task1():
    cycle = 1
    X = 1
    noop = "noop"
    addx = "addx"
    cycles = []
    commands = parseinput()
    for command in commands:
        if command[0] == noop:
            cycle+=1
            cycles.append([cycle,X])
            continue
        else:
            result = addxFunc(cycle, X, int(command[1]))
            cycle = result[0]
            X = result[1]
            tempCycles = result[2]
            for tempCycle in tempCycles:
                cycles.append(tempCycle)
    #return cycle, X, cycles
    sigStrengthSum = 0
    for cyc in cycles:
        if cyc[0] == 20 or cyc[0] == 60 or cyc[0] == 100 or cyc[0] == 140 or cyc[0] == 180 or cyc[0] == 220:
            sigStrengthSum += cyc[0]*cyc[1]
            print(sigStrengthSum)
    return f"The answer to part one is: {sigStrengthSum}"

def task2():
    cycle = 1
    X = 1
    noop = "noop"
    addx = "addx"
    cycles = []
    commands = parseinput()
    for command in commands:
        if command[0] == noop:
            cycle+=1
            cycles.append([cycle,X])
            continue
        else:
            result = addxFunc(cycle, X, int(command[1]))
            cycle = result[0]
            X = result[1]
            tempCycles = result[2]
            for tempCycle in tempCycles:
                cycles.append(tempCycle)

    row = []
    hrtPos = 1
    for cyc in cycles:
        spriteRow = []
        for i in range(40):
            spriteRow.append(".")
        spriteRow[cyc[1]] = "#"
        spriteRow[cyc[1]-1] = "#"
        spriteRow[cyc[1]+1] = "#"

        if hrtPos == 40:
            strRow = ""
            for c in row:
                strRow += c
            print(strRow)
            hrtPos = 1
            row = []
            continue

        if spriteRow[hrtPos] == "#":
            row.append("#")
        else:
            row.append(".")
        hrtPos+=1




print(task1())
task2()