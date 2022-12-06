local FILE = "Day1.txt"

function GetTextLines(FILE) -- Returns all of the lines of a text doccument into a table
    local textlines = {} -- table
    for line in io.lines(FILE) do -- loops through each line
        table.insert(textlines, #textlines+1, line) -- inserts line into table
    end
    return textlines -- returns the table
end

local linesTbl = GetTextLines(FILE) -- Gets variable for the text lines

function Task1(linesTbl) -- Task 1
    for key,value in pairs(linesTbl) do -- For each of the lines  in the linesTbl table do
        for i,j in pairs(linesTbl) do -- Then once again loop through each of the lines in the table
            if value+j == 2020 then -- if the current value of both the 
                print(value*j)
            end
        end
    end
end

function Task2(linesTbl)
    for key,value in pairs(linesTbl) do
        for i,j in pairs(linesTbl) do
            for l,m in pairs(linesTbl) do
                if value+j+m == 2020 then
                    print(value*j*m)
                end
            end
        end
    end
end
Task2(linesTbl)