local FILE = "Day5.txt"

function GetTextLines(FILE)
    local textlines = {}
    for line in io.lines(FILE) do
        table.insert(textlines, #textlines+1, line)
    end
    return textlines
end
local textlines = GetTextLines(FILE)


local initialStacks = { {"W","R","F"},
                        {"T","H","M","C","D","V","W","P"},
                        {"P","M","Z","N","L"},
                        {"J","C","H","R"},
                        {"C","P","G","H","Q","T","B"},
                        {"G","C","W","L","F","Z"},
                        {"W","V","L","Q","Z","J","G","C"},
                        {"P","N","R","F","W","T","V","C"},
                        {"J","W","H","G","R","S","V"}
}

function popStack(stackIt)
    return(table.remove(initialStacks[stackIt],#initialStacks[stackIt]))
end

function appendStack(stackIt,val)
    initialStacks[stackIt][#initialStacks[stackIt]+1] = val
end

function popMultiple(stackIt,amount)
    local cratesRemoved = {}
    for i=1,amount do
        cratesRemoved[#cratesRemoved+1] = table.remove(initialStacks[stackIt],#initialStacks[stackIt])
    end

    local cratesRemovedReverse = {}
    for i = #cratesRemoved,1,-1 do
        cratesRemovedReverse[#cratesRemovedReverse+1] = cratesRemoved[i]
    end
    return cratesRemovedReverse
end



function getVals(line)
    local splitTbl = {}
    for i in string.gmatch(line,"([^".." ".."]+)") do
        splitTbl[#splitTbl+1] = i
    end
    return(splitTbl)
end

function task1()
    for k,line in pairs(textlines) do
        local fulltbl = getVals(line)
        local instructionTbl = {amount = nil, start = nil, finish = nil}
        instructionTbl.amount = tonumber(fulltbl[2])
        instructionTbl.start = tonumber(fulltbl[4])
        instructionTbl.finish = tonumber(fulltbl[6])

        for i=1, instructionTbl.amount do
            appendStack(instructionTbl.finish,popStack(instructionTbl.start))
        end
    end
    local topString = ""
    for k,v in pairs(initialStacks) do
        topString = topString..initialStacks[k][#initialStacks[k]]
    end
    return(topString)
end

function task2()
    for k,line in pairs(textlines) do
        local fulltbl = getVals(line)
        local instructionTbl = {amount = nil, start = nil, finish = nil}
        instructionTbl.amount = tonumber(fulltbl[2])
        instructionTbl.start = tonumber(fulltbl[4])
        instructionTbl.finish = tonumber(fulltbl[6])

        local removedItems = popMultiple(instructionTbl.start,instructionTbl.amount)
        for k,v in pairs(removedItems) do
            appendStack(instructionTbl.finish,removedItems[k])
        end
    end
    local topString = ""
    for k,v in pairs(initialStacks) do
        topString = topString..initialStacks[k][#initialStacks[k]]
    end
    return(topString)
end


--print(task1())
--print(task2())