local FILE = "D1Input.txt"

function GetTextLines(FILE)
    local textlines = {}
    local count = 1
    for line in io.lines(FILE) do
        table.insert(textlines, count, line)
        count = count+1
    end
    return textlines
end

local lines = GetTextLines(FILE)

function GetTotalElfCalories(lines)
    local count = 0
    ElfCalories = {}
    for k,line in pairs(lines) do
        if line ~= "" then
            count = count +tonumber(line)
        elseif  line == "" then
        ElfCalories[#ElfCalories+1] = count
        count = 0
        end
    end
    
    return(ElfCalories)
end
TotalCalories = GetTotalElfCalories(lines)

function GetMaxElement(tbl)
    max = 0
    index = 0 
    for k,v in pairs(tbl) do
        if v> max then
            max = v
            index = k
        end
    end
    table.remove(TotalCalories,index)
    return(max)
end

Top3Calories = {}
for i = 1, 3, 1 do
    table.insert(Top3Calories,#Top3Calories+1,GetMaxElement(TotalCalories))
end

Top3Count = 0
for k, v in pairs(Top3Calories) do
    Top3Count = Top3Count + v
end
print(Top3Count)
