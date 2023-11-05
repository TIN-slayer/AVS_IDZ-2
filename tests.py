tests = [7, 458, 7894]
for i in range(3):
    term_num = tests[i]
    pi = 3.00
    num1 = 2
    num2 = 3
    num3 = 4
    for j in range(term_num - 1):
        pi += (((-1)**(j%2)) * (4 / (num1 * num2 * num3)))
        num1 += 2
        num2 += 2
        num3 += 2
    print(f"Test {(i+1)}")
    print(f"Number of terms in Nilakantha's series: {term_num}")
    print(f"Calculated pi = {pi}")
    