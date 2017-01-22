#!/usr/bin/ruby

def youGuess
	@lower = 0
	@upper = 0
	@correct = false
	@limit = 10
	@count = 0
	@ready = false
	@guesses = []

	puts "Cool. You'll pick a number and I'll guess what it is."
	sleep(1)
	print "First thing first. Let's play between 0 and ? "
	@upper = gets.chomp
	@upper = @upper.to_i
	sleep(1)
	puts "Great! Between 0 and " + @upper.to_s + ". Now, think of a number."
	sleep(1)
	puts "DONT'T SAY IT OUT LOUD"
	while !@ready
		sleep(2)
		print "Ready? (y/n) "
		read = gets.chomp
		if read == "y" || read == "Y"
			@ready = true
		end
	end
	puts "Okay. I'm going to try and guess it within " + @limit.to_s + " guesses."
	sleep(1)

	while !@correct && @count <= (@limit)
		@guesses[@count] = (@upper - ((@upper - @lower) / 2))
		print "Guess " + (@count + 1).to_s + " - Is " + (@guesses[@count]).to_s + " too high, too low or correct? (h/l/c) "
		ans = gets.chomp
		case ans
			when "h" || "H"
				then @upper = @guesses[@count]
				@count += 1
			when "l" || "L"
				then @lower = @guesses[@count]
				@count += 1
			when "c" || "C"
				then @correct = true
			when ""
				puts "	You forgot to type something..."
				redo
			else
				puts "	Press either h or l or c"
				sleep(1)
				redo
		end
	end

	puts
	if @correct
		puts "I got it! It only took " + (@count + 1).to_s + " guesses!"
		puts "They were - " + @guesses.to_s
	else
		puts "You stumped me!"
	end
	puts
end

def compGuess
	@lower = 0
	@upper = 0
	@correct = false
	@limit = 10
	@count = 0
	@guesses = []
	@ans = 0

	puts "My turn!!! Now I get to think of the number"
	print "I'll think of a number between 0 and ? "
	@upper = gets.chomp
	@upper = @upper.to_i
	puts "Okay! Between 0 and " + @upper.to_s + ". Let me think of my number."
	2.times do
		puts "Thinking"
		sleep(1)
	end
	@num = rand(@upper)
	puts "Got it! Time to guess."

	while !@correct && @count <= (@limit)
		print "Guess " + (@count + 1).to_s + " - "
		@ans = Integer(gets)
		@guesses[@count] = @ans

		if @ans < @num
			puts "		Too Low!"
			@count += 1
		elsif @ans > @num
			puts "		Too High!"
			@count += 1
		elsif @ans == @num
			then @correct = true
		else
			puts "	Type in your guess"
			sleep(1)
			redo
		end
	end

	puts
	if @correct
		puts "You got it in " + (@count + 1).to_s + " guesses!"
		puts "They were - " + @guesses.to_s
	else
		puts "You stumped me!"
	end
end