food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"

# a) Use split to convert the strings into four cabinet lists. Alphabetize the contents of each cabinet.
food_cabinet = food.split(",")
food_cabinet.sort()

equipment_cabinet = equipment.split(",")
equipment_cabinet.sort()

pets_cabinet = pets.split(",")
pets_cabinet.sort()

sleep_cabinet = sleep_aids.split(",")
sleep_cabinet.sort()

print(food_cabinet)
print(equipment_cabinet)
print(pets_cabinet)
print(sleep_cabinet)

# b) Initialize a cargo_hold list and add the cabinet lists to it. Print cargo_hold to verify its structure.
cargo_hold = []

cargo_hold.append(food_cabinet)
cargo_hold.append(equipment_cabinet)
cargo_hold.append(pets_cabinet)
cargo_hold.append(sleep_cabinet)

print(cargo_hold)

# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.
cabinet_choice = int(input("Select a cabinet (0 - 3): "))

# d) Use bracket notation and format to display the contents of the selected cabinet. If the user entered an invalid number, print an error message.
if 0 <= cabinet_choice <= 3:
    print("Cabinet {} contains: {}".format(cabinet_choice, cargo_hold[cabinet_choice]))
else:
    print("Error: Invalid cabinet number.")

# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND a particular item. Use the in method to check if the cabinet contains the selected item, then print “Cabinet ____ DOES/DOES NOT contain ____.”
cabinet_choice = int(input("Select a cabinet (0 - 3): "))
item_choice = input("Enter an item to search for: ")

if 0 <= cabinet_choice <= 3:
    if item_choice in cargo_hold[cabinet_choice]:
        print("Cabinet {} DOES contain {}.".format(cabinet_choice, item_choice))
    else:
        print("Cabinet {} DOES NOT contain {}.".format(cabinet_choice, item_choice))
else:
    print("Error: Invalid cabinet number.")