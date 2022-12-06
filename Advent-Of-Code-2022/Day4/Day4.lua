local FILE = "Day4.txt"

function GetTextLines(FILE)
    local textlines = {}
    for line in io.lines(FILE) do
        table.insert(textlines, #textlines+1, line)
    end
    return textlines
end
local textlines = GetTextLines(FILE)

function getPair(line)
    local pairTbl = {}
    local pair = {}
    for i in string.gmatch(line,"([^"..",".."]+)") do
        pair[#pair+1] = i
    end

    for k,v in pairs(pair) do
        local person = {}
        for i in string.gmatch(pair[k],"([^".."-".."]+)") do
            person[#person+1] =tonumber(i)
        end
        pairTbl[#pairTbl+1] = person
    end
    return pairTbl
end

function task1(lines)
    local count = 0
    for k,line in pairs(lines) do
        local pairTbl = getPair(line)
        local p1Min = pairTbl[1][1]
        local p1Max = pairTbl[1][2]
        local p2Min = pairTbl[2][1]
        local p2Max = pairTbl[2][2]
        if ((p1Min <= p2Min) and (p1Max >= p2Max)) or ((p2Min <= p1Min) and (p2Max >= p1Max))then
            count = count + 1
        end
    end
    return(count)
end

function task2(lines)
    local count = 0
    for k,line in pairs(lines) do
        local pairTbl = getPair(line)
        local p1Min = pairTbl[1][1]
        local p1Max = pairTbl[1][2]
        local p2Min = pairTbl[2][1]
        local p2Max = pairTbl[2][2]
        if ((p1Min <= p2Min and p2Min<=p1Max) or (p1Min <= p2Max and p2Max<=p1Max)) or ((p2Min<=p1Min and p1Min<=p2Max) or (p2Min <= p1Max and p1Max<=p2Max)) then
            count = count + 1
        end
    end
    return(count)
end


---print(task1(textlines))
print(task2(textlines))

