class Hangman

  attr_reader :counter, :word_placeholder, :previous_choice, :missed_counter  #, :game_word
  attr_accessor :user_input
  def initialize(word)
    @word = word
    @counter = 0
    @missed_counter = 0
    #	@game_word = word
    @previous_choice = []
    @word_placeholder = Array.new(word.length, '_')
  end


  def play

    if user_input.length > 1
      if @word == user_input
        @counter = @word.length
        #result(@counter, @missed_counter)
      else
        @missed_counter += 1
        @previous_choice.push(user_input)
      end
    else
      temp = @word.split("")
      found_count = temp.each_index.select{|i| temp[i].casecmp(user_input) == 0}
      if found_count.length > 0
        @counter += found_count.length
        found_count.each do |index|
          word_placeholder[index]= user_input
        end
      else
        @missed_counter += 1
      end

    end
#    result
  end

  def result
    if @counter == @word.length
      puts "you Win"
      puts "Games Word :: " + @word
    end
    if @missed_counter == 6
      puts "you Loss"
      puts "Games Word :: " + @word
    end
  end

  def game_start

    while @counter < @word.length && @missed_counter < 6 do
      print "Game Word :: - "
      @word_placeholder.each do |u|
        print u + " "
      end
      puts " "
      print "wrong choice :: " + @missed_counter.to_s
      puts " "
      print "Enter character ::--"
      @user_input = gets.chomp
      play
      result
    end
  end

end
Hangman.new("hello").game_start