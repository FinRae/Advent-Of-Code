local FILE = "Day1.txt"

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

function Task1()
    local count = 0
    for k,v in pairs(inputTbl) do if v == "(" then count = count + 1 else count = count -1 end end return count
end

function Task2()
    local count = 0
    for k,v in pairs(inputTbl) do
        if v == "(" then
            count = count + 1
        else 
            count = count -1
        end
        if count < 0 then return(k) end
    end
end


print(Task1())
print(Task2())