local FILE = "Day6.txt"

function GetText(FILE)
    local file = io.open(FILE,"rb")
    local contents = file:read("*all")
    io.close(file)
    contentsTbl = {}
    for i=1,#contents do
        contentsTbl[#contentsTbl+1] = contents:sub(i,i)
    end
    return(contentsTbl)
end
local inputTbl = GetText(FILE)

function table.HasValue(tbl,value)
    for k,tableVal in pairs(tbl) do
        if value == tableVal then
            return true
        end
    end
    return false
end

function checkChars(charTbl)
    local appearedTbl = {}

    for k,v in pairs(charTbl) do
        if not table.HasValue(appearedTbl,v) then
            appearedTbl[#appearedTbl+1] = v
        end
    end
    if #appearedTbl == #charTbl then
        return true
    else
        return false
    end
end

function Task1()
    for k,v in pairs(inputTbl) do
        local charTbl = {}
        for i=0,3 do
            table.insert(charTbl,#charTbl+1,inputTbl[k+i])
        end
        if checkChars(charTbl) then
            return(k+3)
        end
    end
end
function Task2()
    for k,v in pairs(inputTbl) do
        local charTbl = {}
        for i = 1,14 do
            table.insert(charTbl,#charTbl+1,inputTbl[k+i])
        end
        if checkChars(charTbl) then
            return(k+14)
        end
    end
end
print(Task1())
print(Task2())

