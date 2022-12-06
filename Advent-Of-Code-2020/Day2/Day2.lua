local FILE = "Day2.txt"

function GetTextLines(FILE)
    local textlines = {}
    for line in io.lines(FILE) do
        table.insert(textlines, #textlines+1, line)
    end
    return textlines
end
local textlines = GetTextLines(FILE)

local function getPolicy(line)
    local policy = {min = nil,
              max = nil,
              char = nil}
    if line:sub(2,2) == "-" then
        policy.min = tonumber(line:sub(1,1))
        if line:sub(4,4) == " " then
            policy.max = tonumber(line:sub(3,3))
        else
            policy.max = tonumber(line:sub(3,3)..line:sub(4,4))
        end
    end
    if line:sub(3,3) == "-" then
        policy.min = tonumber(line:sub(1,1)..line:sub(2,2))
        policy.max = tonumber(line:sub(4,4)..line:sub(5,5))
    end
    for i = 1, #line do 
        if line:sub(i,i) == ":" then
            policy.char = line:sub(i-1,i-1)
            break
        end
    end
    return policy
end
local function getPassword(line)
    local min = nil
    for i = 1, #line do
        local char = line:sub(i,i)
        if char == ":" then
            min = i+2
        end
    end
    local password = string.sub(line,min,#line)
    return password
end
local function checkPasswordsPart1(lines)
    local validPasswords = 0
    for k,line in pairs(lines) do
        local password = getPassword(line)
        local policy = getPolicy(line)
        local policyCharCount = 0
        for i = 1, #password do
            local char = password:sub(i,i)
            if char == policy.char then
                policyCharCount = policyCharCount +1
            end
        end
        
        if policyCharCount >= policy.min and policyCharCount <= policy.max then
            validPasswords = validPasswords+1
        end
    end
    return(validPasswords)
end
function xor(a,b)
    return (a or b) and not (a and b)
end 
local function checkPasswordsPart2(lines)
    local validPasswords = 0
    for k,line in pairs(lines) do
        local password = getPassword(line)
        local policy = getPolicy(line)
        local pwChar1 = password:sub(policy.min,policy.min)
        local pwChar2 = password:sub(policy.max,policy.max)
        if xor((policy.char == pwChar1),(policy.char == pwChar2)) then
            validPasswords = validPasswords+1
        end
    end
    return(validPasswords)
end




function Part1(textlines)
    print(checkPasswordsPart1(textlines))
end
function Part2(textlines)
    print(checkPasswordsPart2(textlines))
end
