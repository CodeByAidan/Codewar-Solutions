def show_sequence(n):

    if n < 0:
        return str(n) + "<0"
    if n == 0:
        return str(n) + "=0"

    summ = sum(range(n+1))
    numstr = "+".join(map(str, range(n+1)))

    return numstr + " = " + str(summ)
