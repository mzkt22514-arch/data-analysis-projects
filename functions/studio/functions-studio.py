# We want to COMPLETELY reverse a list by flipping the order of the entries AND flipping the order of characters in each element.

# a) Define a 'reverse_characters' function. Give it one parameter, which will be the string to reverse.
# b) Within the function, use the 'list' function to split a string into a list of individual characters
# c) 'reverse' your new list.
# d) Use 'join' to create the reversed string and return that string from the function.
# e) Create a variable of type string to test your new function. 
# f) Use 'print(reverse_characters(my_variable_name))'; to call the function and verify that it correctly reverses the characters in the string.
# g) Use method chaining to reduce the lines of code within the function.

def reverse_characters(string_reverse):  
    char_list = list(string_reverse)
    char_list.reverse()
    reversed_string = ''.join(char_list)
    return reversed_string

my_test_string = "apple"

print(reverse_characters(my_test_string))

# 2) The 'split' method does not work on numbers, but we want the function to return a number with all the digits reversed (e.g. 1234 converts to 4321 and NOT the string "4321")
# a) Add an if statement to your reverse_characters function to check the typeof the parameter.
# b - d) If type is ‘string’, return the reversed string as before. If type is ‘number’, convert the parameter to a string, reverse the characters, then convert it back into a number. Return the reversed number.
# e) Be sure to print the result returned by the function to verify that your code works for both strings and numbers. Do this before moving on to the next steps.

def reverse_characters(value):
    if type(value) == str:
        char_list = list(value)
        char_list.reverse()
        reversed_string = ''.join(char_list)
        return reversed_string
    elif type(value) == int or type(value) == float:
        str_value = str(value)
        char_list = list(str_value)
        char_list.reverse()
        reversed_str = ''.join(char_list)
        if '.' in reversed_str:
            return float(reversed_str)
        else:
            return int(reversed_str)
    else:
        return "Unsupported data type"
print(reverse_characters("apple")) 
print(reverse_characters(1234))       
print(reverse_characters("LC101"))  
print(reverse_characters(8675309))


# 3) Create a new function with one parameter, which is the list we want to change. The function should:
# a) Define and initialize an empty list.
# b) Loop through the old list.
# c) For each element in the old list, call reverse_characters to flip the characters or digits.
# d) Add the reversed string (or number) to the list defined in part ‘a’.
# e) Return the final, reversed list.
# f) Be sure to print the results from each test case in order to verify your code.

def reverse_list(old_list):
    new_list = []
    for item in old_list:
        reversed_item = reverse_characters(item)
        new_list.append(reversed_item)
    return new_list

test1 = ['apple', 'potato', 'Capitalized Words']
test2 = [1234, 'LC101', 8675309, "radar"]

print(reverse_list(test1))
print(reverse_list(test2))

list_test1 = ['apple', 'potato', 'Capitalized Words']
list_test2 = [123, 8897, 42, 1168, 8675309]
list_test3 = ['hello', 'world', 123, 'orange']
