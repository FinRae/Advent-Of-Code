local FILE = "Day3.txt"

function GetTextLines(FILE)
    local textlines = {}
    for line in io.lines(FILE) do
        table.insert(textlines, #textlines+1, line)
    end
    return textlines
end
local textlines = GetTextLines(FILE)

function createGrid(lines)
    grid = {}
    for k,line in pairs(lines) do
        grid[k] = {}
        for i =1, #line do
            grid[k][i] = line:sub(i,i)
        end
    end
    return(grid)
end
local grid = createGrid(textlines)

function appendGrid(lines)
    for k,line in pairs(lines) do
        for i =1, #line do
            grid[k][(#grid[k])+1] =  line:sub(i,i)
        end
    end
end


function printGrid(grid) 
    for k,row in pairs(grid) do
        rowstr = ""
        for i = 1, #row do
            rowstr = rowstr..grid[k][i]
        end
        print(rowstr)
    end
end


playerPos = {x = 1,y = 1}

function movePlayer(x,y)
    playerPos.x = playerPos.x + x
    playerPos.y = playerPos.y + y
end

function checkTree(x,y)
    if grid[y][x] == "#" then
        return(true)
    end
end

function playerGridChange(x,y)
    grid[y][x] = "O"
end


function task1(textlines)
    treeCount = 0
    while playerPos.y < #grid do
        movePlayer(3,1)
        if checkTree(playerPos.x,playerPos.y) then
            treeCount = treeCount + 1
        end
        playerGridChange(playerPos.x,playerPos.y)
        printGrid(grid)
        if playerPos.x >= #grid[1] -5 then
            appendGrid(textlines)
        end
    end
    return(treeCount)
end
function task2(textlines)
    movements = {{1,1},{3,1},{5,1},{7,1},{1,2}}
    totalTrees = {0,0,0,0,0}

    for k,v in pairs(movements) do
        treeCount = 0
        while playerPos.y < #grid do
            movePlayer(movements[k][1],movements[k][2])
            if checkTree(playerPos.x,playerPos.y) then
                treeCount = treeCount + 1
            end

            if playerPos.x >= #grid[1] -15 then
                appendGrid(textlines)
            end
        end

        grid = createGrid(textlines)
        playerPos.x = 1
        playerPos.y = 1
        totalTrees[k] = treeCount
        print(totalTrees[k])
    end
    return(totalTrees[1]*totalTrees[2]*totalTrees[3]*totalTrees[4]*totalTrees[5])
end

print(task1(textlines))
--print(task2(textlines))