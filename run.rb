#!/usr/bin/ruby

require './commands.rb'

def choosePlay
	puts "We're going to play a number guessing game. Who should go first? "
	first = gets.chomp
	if first == "You" || first == "you" || first == "computer" || first == "pc" || first == "mac" || first == "YOU" || first == "U" || first == "u"
		compGuess
		playAgain
	elsif first == "Me" || first == "ME" || first == "I do" || first == 'me'
		youGuess
		playAgain
	else
		puts "I don't recognise that. Try again."
	end
	choosePlay
end

def playAgain
	puts "Should be play again?"
	pg = gets.chomp
	if pg == 'y' || pg == 'Y' || pg == 'YES' || pg == 'Yes' || pg == 'yes'
		choosePlay
	else
		exit
	end
end


choosePlay

