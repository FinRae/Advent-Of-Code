local FILE = "Day3.txt"

function GetTextLines(FILE)
    local textlines = {}
    for line in io.lines(FILE) do
        table.insert(textlines, #textlines+1, line)
    end
    return textlines
end
local textlines = GetTextLines(FILE)


characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

function getPriority(char)
    for i =1, #characters do
        if characters:sub(i,i) == char then
            return i
        end
    end
end

function findCompartments(line)
    local len = #line
    local compartments = {comp1 = nil, comp2 = nil}
    compartments.comp1 = line:sub(1,len/2)
    compartments.comp2 = line:sub((len/2)+1,#line)
    return(compartments)
end

function findDuplicate(compartments) 
    for i =1, #compartments.comp1 do
        for j=1, #compartments.comp2 do
            if compartments.comp1:sub(i,i) == compartments.comp2:sub(j,j) then
                return compartments.comp2:sub(j,j)
            end
        end
    end
end

function findTripleDuplicate(group)
    -- inside here is in a each group
    for i=1,#group.p1 do
        for j=1,#group.p2 do
            if group.p1:sub(i,i) == group.p2:sub(j,j) then
                for k=1, #group.p3 do
                    if group.p3:sub(k,k) == group.p2:sub(j,j) then
                        return(group.p3:sub(k,k))
                    end
                end
            end
        end
    end
end

function task1(lines)
    Count = 0 
    for key,line in pairs(lines) do
        Count = Count + getPriority(findDuplicate(findCompartments(line)))
    end
    return(Count)
end

function task2(lines)
    Count = 0
    for i= 1,#lines,3 do
        group = {p1 = nil, p2 = nil, p3 = nil}
        group.p1 = lines[i]
        group.p2 = lines[i+1]
        group.p3 = lines[i+2]
        Count = Count + getPriority(findTripleDuplicate(group))
    end
    return(Count)
end


--print(task1(textlines))
print(task2(textlines))

