# Exercise #1: Construct for loops that accomplish the following tasks:
    # a. Print the numbers 0 - 20, one number per line.
for i in range(21):
    print(i)
    # b. Print only the ODD values from 3 - 29, one number per line.
for i in range(3, 30, 2):
    print(i)
    # c. Print the EVEN numbers 12 to -14 in descending order, one number per line.
for i in range(12, -15, -2):
    print(i)
    # d. Challenge - Print the numbers 50 - 20 in descending order, but only if the numbers are multiples of 3. (Your code should work even if you replace 50 or 20 with other numbers).
for i in range(50, 19, -1):
    if i % 3 == 0:
        print(i)


