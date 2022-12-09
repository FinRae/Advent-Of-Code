local FILE = "Day2.txt"

-- Rock A / X
-- Paper B / Y
-- Scissors C / Z

function GetRounds(FILE)
    local RoundsTable = {}
    for line in io.lines(FILE) do
        table.insert(RoundsTable, #RoundsTable+1, line)
    end
    return RoundsTable
end
score = 0
function Part1(score,FILE)
    for k,v in pairs(GetRounds(FILE)) do
        local oppMove =  string.sub(v,1,1)
        local plyMove = string.sub(v,3,3)
        
        if plyMove == "X" then
            if oppMove == "A" then
                score = score+3
            elseif oppMove == "C" then
                score = score+6
            end
            score = score+ 1
        elseif plyMove == "Y" then
            if oppMove == "A" then
                score = score+6
            elseif oppMove == "B" then
                score = score+3
            end
            score = score+ 2
        elseif plyMove == "Z" then
            if oppMove == "B" then
                score = score+6
            elseif oppMove == "C" then
                score = score+3
            end
            score = score+ 3
        end
    end
    print(score)
end

function Part2(score,FILE)
    for k,v in pairs(GetRounds(FILE)) do
        local oppMove =  string.sub(v,1,1)
        local result = string.sub(v,3,3)
        local plyMove = nil
        if result == "X" then
            if oppMove == "A" then
                plyMove = "Z"
            elseif oppMove == "B" then
                plyMove = "X"
            elseif oppMove == "C" then
                plyMove = "Y"
            end
        elseif result == "Y" then
            if oppMove == "A" then
                plyMove = "X"
            elseif oppMove == "B" then
                plyMove = "Y"
            elseif oppMove == "C" then
                plyMove = "Z"
            end
        elseif result == "Z" then
            if oppMove == "A" then
                plyMove = "Y"
            elseif oppMove == "B" then
                plyMove = "Z"
            elseif oppMove == "C" then
                plyMove = "X"
            end
        end

        if plyMove == "X" then
            if oppMove == "A" then
                score = score+3
            elseif oppMove == "C" then
                score = score+6
            end
            score = score+ 1
        elseif plyMove == "Y" then
            if oppMove == "A" then
                score = score+6
            elseif oppMove == "B" then
                score = score+3
            end
            score = score+ 2
        elseif plyMove == "Z" then
            if oppMove == "B" then
                score = score+6
            elseif oppMove == "C" then
                score = score+3
            end
            score = score+ 3
        end
        
    end
    print(score)
end
Part1(score,FILE)
Part2(score,FILE)