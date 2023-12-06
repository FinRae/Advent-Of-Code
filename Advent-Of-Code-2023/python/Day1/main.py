def parseinput():
    # This function is to parse the initial input into a usable form
    with open("input.dat") as file:
        input = file.readlines()
        file.close()
    return input


def replacenums(line):
    numberdict = {"one":"o1e", "two":"t2o", "three":"t3e",
                  "four":"f4r", "five":"f5e", "six":"s6x",
                  "seven":"s7n","eight":"e8t", "nine":"n9e"}
    for key in numberdict:
            line =line.replace(key, numberdict[key])

    return line

def task(input,runastask2):
    count = 0
    for line in input:
        if runastask2:
            line = replacenums(line).strip()
        digits = ""
        for i in range(len(line)):
            if line[i].isnumeric():
                first = int(line[i])
                break
        for i in range(len(line)):
            if line[::-1][i].isnumeric():
                last = int(line[::-1][i])
                break
        count += first*10 + last
    return count

if __name__ == "__main__":
    print(task(parseinput(),False))
    print(task(parseinput(),True))