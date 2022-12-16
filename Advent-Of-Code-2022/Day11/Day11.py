def parseinput():
    monkeys = []
    with open("Day11.txt") as file:
        lines = file.readlines()
    monkey = []
    for line in lines:
        if line != "\n":
            line = line.strip("\n")
            monkey.append(line)
        else:
            monkey.pop(0)
            monkeys.append(monkey)
            monkey = []

    newmonkeys = []
    for monkey in monkeys:
        newmonkey = {
            "items": [],
            "operation": [],
            "divBy": 0,
            "ifTrue": 0,
            "ifFalse": 0,
            "inspectedCount": 0
        }
        for line in monkey:
            if line.startswith("  Starting items: "):
                line = line.replace("  Starting items: ", "")
                startswith = line.split(",")
                newmonkey["items"] = startswith
                continue
            if line.startswith("  Operation: new = old "):
                line = line.replace("  Operation: new = old ", "")
                op = line.split(" ")
                newmonkey["operation"] = op
                continue
            if line.startswith("  Test: divisible by "):
                line = line.replace("  Test: divisible by ","")
                newmonkey["divBy"] = int(line)
                continue
            if line.startswith("    If true: throw to monkey "):
                line = line.replace("    If true: throw to monkey ","")
                newmonkey["ifTrue"] = int(line)
                continue
            if line.startswith("    If false: throw to monkey "):
                line = line.replace("    If false: throw to monkey ","")
                newmonkey["ifFalse"] = int(line)
                continue
        newmonkeys.append(newmonkey)
    return newmonkeys

def inspectItems(item, op):
    if op[1] != 'old':
        if op[0] == "*":
            item = ((int(item) * int(op[1]))/3).__floor__()
        else:
            item = ((int(item) + int(op[1]))/3).__floor__()

    else:
        item = ((int(item)**2)/3).__floor__()
    return item

def inspectItemsP2(item, op, monkeys):
    specialNumber = 1
    for monkey in monkeys:
        specialNumber *= monkey["divBy"]

    if op[1] != 'old':
        if op[0] == "*":
            item = ((int(item) * int(op[1])) %specialNumber).__floor__()
        else:
            item = ((int(item) + int(op[1])) %specialNumber).__floor__()

    else:
        item = ((int(item)**2) %specialNumber).__floor__()
    return item




def testItems(item,test):
    if int(item)%int(test) == 0:
        return True
    else:
        return False


def task1(rounds):
    monkeys = parseinput()
    for i in range(rounds):
        for monkey in monkeys:
            for item in monkey["items"]:
                newItem = inspectItems(item,monkey["operation"])
                monkey["inspectedCount"] +=1
                if testItems(newItem,monkey["divBy"]):
                    monkeys[int(monkey["ifTrue"])]["items"].append(newItem)
                else:
                    monkeys[int(monkey["ifFalse"])]["items"].append(newItem)
            monkey["items"] = []
        inspectedCounts = []
    for monkey in monkeys:
        inspectedCounts.append(monkey["inspectedCount"])
    inspectedCounts.sort()
    inspectedCounts.reverse()
    print(inspectedCounts)
    print(f"The part one answer is {inspectedCounts[0]*inspectedCounts[1]}")

def task2(rounds):
    monkeys = parseinput()
    for i in range(rounds):
        for monkey in monkeys:
            for item in monkey["items"]:
                newItem = inspectItemsP2(item,monkey["operation"],monkeys)
                monkey["inspectedCount"] +=1
                if testItems(newItem,monkey["divBy"]):
                    monkeys[int(monkey["ifTrue"])]["items"].append(newItem)
                else:
                    monkeys[int(monkey["ifFalse"])]["items"].append(newItem)
            monkey["items"] = []
        inspectedCounts = []
    for monkey in monkeys:
        inspectedCounts.append(monkey["inspectedCount"])
    inspectedCounts.sort()
    inspectedCounts.reverse()
    print(inspectedCounts)
    print(f"The part two answer is {inspectedCounts[0]*inspectedCounts[1]}")

task1(20)
task2(10000)
