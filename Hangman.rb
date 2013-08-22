class Hangman
  attr_reader :counter, :missed_counter, :word_placeholder, :wrong_choice

 def initialize (word)
   @word=word
   @word_placeholder=["_"]*word.length
   @counter=0
   @missed_counter=0
   @wrong_choice=[]
 end
end