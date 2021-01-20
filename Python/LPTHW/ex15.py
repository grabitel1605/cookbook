#Import the argv method from sys
from sys import argv

script, filename = argv
# set the variable 'txt' to open the 'filename' argument
txt = open(filename)
# print the name of the txt file passed to the 'filename' argument
print(f"Here's your file {filename}:")
#print the contents of the txt file passed to the 'filename' argument
print(txt.read())

txt.close()
"""# This is asking for the file name again
print("Type the filename again:")
file_again = input("> ")
#sets the filename as the variable "file_again"
txt_again = open(file_again)
# prints the content of the given filename
print(txt_again.read())"""
