class Hangman

  attr_reader :counter, :word_placeholder, :previous_choice, :missed_counter  #, :game_word
  attr_accessor :userInput
  def initialize(word)
    @word = word
    @counter = 0
    @missed_counter = 0
    #	@game_word = word
    @previous_choice = []
    @word_placeholder = Array.new(word.length, '_')
  end


  def play
    if userInput.length > 1
      if @word == userInput
        @counter = @word.length
        #result(@counter, @missed_counter)
      else
        @missed_counter += 1
        @previous_choice.push(userInput)
      end
    else
      temp = @word.split("")
      found_count = temp.each_index.select{|i| temp[i].casecmp(userInput) == 0}
      if found_count.length > 0
        @counter += found_count.length
        found_count.each do |index|
          word_placeholder[index]= userInput
        end
      else
        @missed_counter += 1
      end

    end
#    result
  end

  def result
    if @counter == @word.length
      puts "Win"
    end
    if @missed_counter == 6
      puts "Loss"
    end
  end
end
