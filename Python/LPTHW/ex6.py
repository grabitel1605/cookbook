# denotes a variable for the number of "types of people"
types_of_people = 10
# explains how many types of people there are in a string
x = f"There are {types_of_people} types of people."
# assigns a string to a variable
binary = "binary"
# assigns a string to a variable
do_not = "don't"
# inserts 2 variables in a string
y = f"Those who know {binary} and those who {do_not}."
# prints x
print(x)
# prints y
print(y)
# prints a statement with an attached variable
print(f"I said: {x}")
# prints a statement with an attached variable
print(f"I also said: '{y}'")
# assigns a boolean to a variable
hilarious = True
# assigns a string to a variable
joke_evaluation = "Isn't that joke so funny?! {}"
# prints joke_evaluation and uses .format() to format using a boolean
print(joke_evaluation.format(hilarious))
# assings a string to a variable
w = "This is the left side of..."
# assigns a string to a variable
e = "a string with a right side."
# prints 2 variables containing strings
print(w + e)

# 1.) done, see above
# 2.) 5 locations when a string is inserted into another strings
# 3.) haha
# 4.) The "+" when used with strings is not used as an arithmetic operator
#       but rather used to concatenate the two strings together.
