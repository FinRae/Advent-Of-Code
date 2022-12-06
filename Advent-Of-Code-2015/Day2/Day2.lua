local FILE = "Day2.txt"

function GetTextLines(FILE)
    local textlines = {}
    for line in io.lines(FILE) do
        table.insert(textlines, #textlines+1, line)
    end
    return textlines
end
local textlines = GetTextLines(FILE)

function getDims(line)
    local Dims = {}
    for i in string.gmatch(line,"([^".."x".."]+)") do
        Dims[#Dims+1] = tonumber(i)
    end
    return(Dims)
end

function getSmallest(tbl)
    min = 1000000000000
    for k,v in pairs(tbl) do
        if tbl[k]<min then
            min = tbl[k]
        end
    end
    return min
end
function Task1()
    local DimensionsTable = {l =nil,w = nil,h = nil}
    local count = 0
    for k,line in pairs(textlines) do
        local dims = getDims(line)
        DimensionsTable.l = dims[1]
        DimensionsTable.w = dims[2]
        DimensionsTable.h = dims[3]
        side1 = DimensionsTable.l*DimensionsTable.w
        side2 = DimensionsTable.w*DimensionsTable.h
        side3 = DimensionsTable.h*DimensionsTable.l
        local sides = {side1,side2,side3}
        local smallestSide = getSmallest(sides)
        count = count + ((2*side1) + (2*side2) + (2*side3))
        count = count+smallestSide

        
    end
    return(count)
end

function Task2()
    local DimensionsTable = {l =nil,w = nil,h = nil}
    local count = 0
    for k,line in pairs(textlines) do
        local dims = getDims(line)
        DimensionsTable.l = dims[1]
        DimensionsTable.w = dims[2]
        DimensionsTable.h = dims[3]
        side1 = DimensionsTable.l*DimensionsTable.w
        side2 = DimensionsTable.w*DimensionsTable.h
        side3 = DimensionsTable.h*DimensionsTable.l
        local sides = {side1,side2,side3}
        local smallestSide = getSmallest(sides)

        local perimiters = {(2*DimensionsTable.l+2*DimensionsTable.w),(2*DimensionsTable.w+2*DimensionsTable.h),(2*DimensionsTable.h+2*DimensionsTable.l)}

        count = count + (getSmallest(perimiters)) + (DimensionsTable.l*DimensionsTable.w*DimensionsTable.h)
    end
    return(count)
end
--print(Task1())
print(Task2())