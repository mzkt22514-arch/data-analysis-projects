# 1. Declare and assign the variables here:
shuttle_name = "Determination"
shuttle_speed_mph = 17500
distance_to_mars_km = 225000000
distance_to_moon_km = 384400
miles_per_km = 0.621

# 2. Use print() to print the 'type' each variable. Print one item per line.
print(type(shuttle_name))
print(type(shuttle_speed_mph))
print(type(distance_to_mars_km))
print(type(distance_to_moon_km))
print(type(miles_per_km))
# Answer: <class 'str'>
#<class 'int'>
#<class 'int'>
#<class 'int'>
#<class 'float'>

# Code your solution to exercises 3 and 4 here:
# Step 1: Convert km to miles
miles_to_mars = distance_to_mars_km * miles_per_km


# Step 2: Calculate hours to Mars
hours_to_mars = miles_to_mars / shuttle_speed_mph

# Step 3: Convert hours to days
days_to_mars = hours_to_mars / 24

# Step 4: Print result
print(shuttle_name, "will take", round(days_to_mars), "days to reach Mars.")
#Answer: Determination will take 333 days to reach Mars.

# Code your solution to exercise 5 here
kilometers_to_moon = 384400
MILES_PER_KM = 0.621

miles_to_moon = kilometers_to_moon * MILES_PER_KM
hours_to_moon = miles_to_moon / shuttle_speed_mph
days_to_moon = hours_to_moon / 24

print(shuttle_name + " will take " + str(round(days_to_moon, 2)) + " days to reach the Moon.")
#Answer: Determination will take 0.57 days to reach the Moon.