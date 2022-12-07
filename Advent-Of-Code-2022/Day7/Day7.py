from collections import defaultdict


with open("Day7.txt") as file:
    blocks = ("\n" + file.read().strip()).split("\n$ ")[1:]


path = []

dir_sizes = defaultdict(int)
children = defaultdict(list)


def parse(block):
    lines = block.split("\n")
    command = lines[0]
    outputs = lines[1:]

    parts = command.split(" ")
    operation = parts[0]
    if operation == "cd":
        if parts[1] == "..":
            path.pop()
        else:
            path.append(parts[1])
        return

    txtpath = "/".join(path)

    sizes = []
    for line in outputs:
        if not line.startswith("dir"):
            sizes.append(int(line.split(" ")[0]))
        else:
            dir_name = line.split(" ")[1]
            children[txtpath].append(f"{txtpath}/{dir_name}")

    dir_sizes[txtpath] = sum(sizes)


for block in blocks:
    parse(block)



def search(txtpath):
    size = dir_sizes[txtpath]
    for child in children[txtpath]:
        size += search(child)
    return size


def part1():
    count = 0
    for txtpath in dir_sizes:
        if search(txtpath) <= 100000:
            count += search(txtpath)

    print(count)

#part1()


def part2():
    Available_space = 70000000 - search("/")
    Required_space = 30000000 - Available_space

    ans = 999999999999999999999999 # big number
    for txtpath in dir_sizes:
        size = search(txtpath)
        if size>= Required_space:
            ans = min(ans,size)

    print(ans)



