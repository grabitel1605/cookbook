# sets number of cars
cars = 100
# sets available space in a car
space_in_a_car = 4
# sets number of drivers
drivers = 30
# sets number of passengers
passengers = 90
# subtracts number of drivers from number of cars
cars_not_driven = cars - drivers
# provides number of cars_driven based on number of drivers
cars_driven = drivers
# explains the capacity that can be filled based on number of cars driven
# multiplied by the space available in each car
carpool_capacity = cars_driven * space_in_a_car
# this explains how many passengers need to be in each car to provide everyone a ride
average_passengers_per_car = passengers / cars_driven


print("There are", cars, "cars available.")
print("There are only", drivers, "drivers available.")
print("There will be", cars_not_driven, "empty cars today.")
print("We can transport", carpool_capacity, "people today.")
print("We have", passengers, "to carpool today.")
print("We need to put about", average_passengers_per_car, "in each car.")



# car_pool_capacity at the time of the error wasnt set as a variable

# 1.) it wasnt absolutely necessary to use a floating point number for space_in_a_car
#       Its fine to just use 4, nothing major changes.

# 2.) 4.0 is "apparently" more accurate as a floating point number

# 3.) comments have been writin

# 4.) a single "=" is an assignment operator, where as a double "=="  denotes equal to.

# 5.) _ <-- The underscore is a character but is used in place of a "space"
