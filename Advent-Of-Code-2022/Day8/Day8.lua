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



function printGrid(grid) 
    for k,row in pairs(grid) do
        rowstr = ""
        for i = 1, #row do
            rowstr = rowstr..tostring(grid[k][i])
        end
        print(rowstr)
    end
end

function IsVisible(tree,x,y)
    if ((x == 1) or (x == #grid[1])) or ((y == 1) or (y == #grid)) then -- Checks if the tree is on the border
        return true
    end

    --check left
    local visible_Left = true
    for i = x-1,1,-1 do
        if tonumber(grid[y][i]) >= tree then
            visible_Left = false
        end
    end
    -- check right
    local visible_Right = true
    for i = x+1, #grid[1] do
        if tonumber(grid[y][i]) >= tree then
            visible_Right = false
        end
    end
    -- check top
    local visible_Top = true
    for i = y-1,1,-1 do
        if tonumber(grid[i][x]) >= tree then
            visible_Top = false
        end
    end
    -- check bottom
    local visible_Bottom = true
    for i = y+1,#grid do
        if tonumber(grid[i][x]) >= tree then
            visible_Bottom = false
        end
    end
    if visible_Left or visible_Right or visible_Bottom or visible_Top then
        return true
    else 
        return false
    end
end

function getScore(tree,x,y)
    local count = 0
    if ((x == 1) or (x == #grid[1])) or ((y == 1) or (y == #grid)) then -- Checks if the tree is on the border
        return count
    end
      --check left
      local leftCount = 0
      for i = x-1,1,-1 do
          if tonumber(grid[y][i]) >= tree then
            leftCount = leftCount + 1
            break
          end
          leftCount = leftCount + 1
      end
      -- check right
      local rightCount = 0
      for i = x+1, #grid[1] do
          if tonumber(grid[y][i]) >= tree then
            rightCount = rightCount + 1
            break
          end
          rightCount = rightCount + 1
      end
      -- check top
      local topCount = 0
      for i = y-1,1,-1 do
          if tonumber(grid[i][x]) >= tree then
            topCount = topCount + 1
            break
          end
          topCount = topCount + 1
      end
      -- check bottom
      local bottomCount = 0
      for i = y+1,#grid do
          if tonumber(grid[i][x]) >= tree then
            bottomCount = bottomCount + 1
            break
          end
          bottomCount = bottomCount + 1
      end
      count = leftCount*rightCount*topCount*bottomCount
      return count
end

function task1()
    count = 0
    for k,row in pairs(grid) do
        for i,tree in pairs(row) do
            if IsVisible(tonumber(tree),i,k) then
                count = count + 1
            end
        end
    end
    return(count)
end

function task2()
    local maxscore = -1
    for k,row in pairs(grid) do
        for i,tree in pairs(row) do
            maxscore = math.max(maxscore,getScore(tree,i,k))
        end
    end
    return(maxscore)
end

print(task1())
print(task2())
