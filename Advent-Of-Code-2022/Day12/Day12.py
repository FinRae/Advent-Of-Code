def parseinput():
    grid = []
    with open("Day12.txt") as file:
        lines = file.readlines()
        for line in lines:
            line = line.strip('\n')
            row = []
            for chr in line:
                row.append(chr)
            grid.append(line)

    return grid
grid = parseinput()
def printGrid(grid):
    stringGrid = ""
    for row in grid:
        strRow = ""
        for chr in row:
            strRow = strRow+chr
        print(strRow)
def getStartPos(grid):
    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if grid[i][j] == 'S':
                return [j,i]
def getEndPos(grid):
    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if grid[i][j] == 'E':
                return [j,i]
def getHeight(x ,y):
    if x < 0 or x >= len(grid[0]) or y < 0 or y >= len(grid): return ""
    if grid[y][x] == 'S': return 'a'
    elif grid[y][x] == "E": return 'z'
    else: return grid[y][x]

def canMove(fromChar,toChar):
    if fromChar == "" or toChar == "": return False
    fromHeight = ord(fromChar)
    toHeight = ord(toChar)
    if toHeight-fromHeight <=1:
        return True
    else: return False

def doBFS(start, end):
    queue = [start]
    visited = [start]
    dist = 0
    while queue and end not in queue:
        neighbours = []
        dist+=1
        for pos in queue:
            xPos = pos[0]
            yPos = pos[1]
            for i in range(-1,2): # goes from -1 to 1
                for j in range(-1,2): # goes from -1 to 1
                    if abs(i) > 0 and abs(j) > 0:
                        continue
                    neighbour = [xPos+i,yPos+j]
                    fromChar = getHeight(xPos,yPos)
                    toChar = getHeight(neighbour[0],neighbour[1])
                    if canMove(fromChar,toChar) and neighbour not in visited:
                        neighbours.append(neighbour)
                        visited.append(neighbour)
        queue = neighbours
    return dist if end in queue else -1

def part1():
    startX = getStartPos(grid)[0]
    startY = getStartPos(grid)[1]
    endX = getEndPos(grid)[0]
    endY = getEndPos(grid)[1]
    print(f"The answer to part 1 is {doBFS([startX,startY],[endX,endY])}")

def part2():
    endX = getEndPos(grid)[0]
    endY = getEndPos(grid)[1]
    lowest = 1 << 30
    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if getHeight(j,i) == 'a':
                dist = doBFS([j, i], [endX, endY])
                if dist != -1:
                    lowest = min(dist,lowest)
    print(f"The answer to part 2 is {lowest}")


part1()
print("Part 2 takes a few minutes to run so bare with it.")
part2()