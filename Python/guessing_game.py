import random

# Game set up
print("Welcome to the guessing game!")
number_of_guesses = 3 # User has three guesses before losing the game
user_won = False

# Computer guesses a random number between 1 and 10
correct_answer = random.randint(1, 10)

while number_of_guesses > 0:
    # User guesses number
    user_guess = input("Guess my number: ")
    user_guess = int(user_guess)
    if user_guess == correct_answer:
        print("Good guess!, you're correct!")
        user_won = True
        break
    # Computer tells user whether guess was to high or to low
    elif user_guess > correct_answer:
        print("Sorry, you guessed to high!")
    elif user_guess < correct_answer:
        print("Sorry, you guessed to low!")

    number_of_guesses -= 1

if user_won == True:
    print("You Win!")
else:
    print("You Lose!")
