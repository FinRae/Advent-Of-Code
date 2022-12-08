local FILE = "Day8.txt"

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
            grid[k][i] = tonumber(line:sub(i,i))
        end
    end
    return(grid)
end
local grid = createGrid(textlines)


function createSeenGrid(lines)
    seengrid = {}
    for k,line in pairs(lines) do
        seengrid[k] = {}
        for i =1, #line do
            seengrid[k][i] = tonumber(line:sub(i,i))
        end
    end
    return(seengrid)
end
local seenGrid = createSeenGrid(textlines)



function printGrid(grid) 
    for k,row in pairs(grid) do
        rowstr = ""
        for i = 1, #row do
            rowstr = rowstr..grid[k][i]
        end
        print(rowstr)
    end
end

function invertGrid(grid)
    local invGrid = {}
    for k=1,99 do
        invGrid[k] = {}
        for i,row in pairs(grid) do
            invGrid[k][#invGrid[k]+1] = row[k]
        end
    end
    return(invGrid)
end




function checkLeft()
    local count = 0
    for k,row in pairs(grid) do
        local maxHeight = -1
        for i,tree in pairs(grid[k]) do
            if seenGrid[k][i] ~= "X" then
                if tree > maxHeight then
                    maxHeight = tree
                    count = count + 1
                    seenGrid[k][i] = "X"
                end
            end
        end
    end
    return(count)
end

function checkRight()
    local count = 0
    for k,row in pairs(grid) do
        local maxHeight = -1
        for i = #grid[k],1,-1 do
            local tree = grid[k][i]
            if seenGrid[k][i] ~= "X" then
                if tree > maxHeight then
                    maxHeight = tree
                    count = count + 1
                    seenGrid[k][i] = "X"
                end
            end
        end
    end
    return(count)
end

local invGrid = invertGrid(grid)
local invSeenGrid = invertGrid(seenGrid)


function checkTop()
    local count = 0
    for k,row in pairs(invGrid) do
        local maxHeight = -1
        for i,tree in pairs(invGrid[k]) do
            if invSeenGrid[k][i] ~= "X" then
                if tree > maxHeight then
                    maxHeight = tree
                    count = count + 1
                    invSeenGrid[k][i] = "X"
                end
            end
        end
    end
    return(count)
end

function checkBottom()
    local count = 0
    for k,row in pairs(invGrid) do
        local maxHeight = -1
        for i = #invGrid[k],1,-1 do
            local tree = invGrid[k][i]
            if invSeenGrid[k][i] ~= "X" then
                if tree > maxHeight then
                    maxHeight = tree
                    count = count + 1
                    invSeenGrid[k][i] = "X"
                end
            end
        end
    end
    return(count)
end

function task1()
    count = 0
    count = count +checkLeft()
    count = count + checkRight()
    invGrid = invertGrid(grid)
    invSeenGrid = invertGrid(seenGrid)
    count = count + checkTop()
    count = count + checkBottom()
    printGrid(invGrid)
    print("  ")
    printGrid(invSeenGrid)
    print(count)
end

task1()