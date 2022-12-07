local FILE = "Day7.txt"

function GetText(FILE)
    local file = io.open(FILE,"rb")
    local contents = file:read("*all")
    io.close(file)
    local blocks  = {}
    
    for i in string.gmatch(contents,"([^".."$".."]+)") do
        table.insert(blocks,#blocks+1,"$"..i)
        print(blocks[#blocks])
    end


end
local inputTbl = GetText(FILE)

local path = {}

local children = {}
local dir_sizes = {}
