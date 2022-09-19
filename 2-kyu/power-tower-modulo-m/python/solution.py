from math import log
#b ** (q * totient(m) + r) % m == b ** r % m
def totient(n):
    n2 = n
    p = 2
    while p * p <= n:
        if n % p == 0:
            n2 = n2 * (p-1) // p
            while n % p == 0: n //= p
        p += 1 + p % 2
    if n > 1:
        n2 = n2 * (n-1) // n
    return n2

def tower(base, h, m): # base, height, modulus
    if m == 1: return 0
    if base == 1 or h == 0: return 1
    res = 1
    for _ in range(h):
        if res * log(base) > log(m): break
        res = base ** res
    else: return res % m
    tot = totient(m)
    return pow(base, tot + tower(base, h-1, tot), m)
