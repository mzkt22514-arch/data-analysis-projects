my_string = "LaunchCode"


# a) Use string methods to remove the first three characters from the string and add them to the end.
my_string = "LaunchCode"
modified_string = my_string[3:] + my_string[:3]
print(modified_string)


# Use a template literal to print the original and modified string in a descriptive phrase.
my_string = "LaunchCode"
modified_string = my_string[3:] + my_string[:3]
print (f"Original string: {my_string}, Modified string: {modified_string}")

# b) Modify your code to accept user input. Query the user to enter the number of letters that will be relocated.
my_string = "LaunchCode"
num_letters = int(input("How many letters should be moved to the end? "))
modified_string = my_string[num_letters:] + my_string[:num_letters]
print (modified_string)

# c) Add validation to your code to deal with user inputs that are longer than the word. In such cases, default to moving 3 characters. Also, the template literal should note the error.
my_string = "LaunchCode"
num_letters = int(input("How many letters should be moved to the end? "))
if num_letters > len(my_string):
    num_letters = 3
    modified_string = my_string[num_letters:] + my_string[:num_letters]
    print(f"Original: {my_string} -> Modified: {modified_string} (input too large, defaulted to 3)")
else:
    modified_string = my_string[num_letters:] + my_string[:num_letters]
    print(f"Original: {my_string} -> Modified: {modified_string}") 
                        