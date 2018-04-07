
def horner(coeffs, x):
    acc = 0
    for c in reversed(coeffs):
        acc = acc * x + c
    return acc

