require './Hangman'
describe Hangman   do
  subject(:hangman){ Hangman.new("elephantisis")}

  # complete


  context "#play" do

    it "should accept only alphabet" do
      hangman.userInput = 'aa'
      expect(hangman.userInput.match(/^[[:alpha:]]+$/).nil? ).to eq(false)
    end

    it "for correct choice full word" do
      hangman.userInput = 'elephantisis'
      hangman.play
      hangman.counter.should == 12
    end

    it "for correct choice single character" do
      hangman.userInput = 'h'
      temp = hangman.counter
      hangman.play
      (hangman.counter - temp).should == 1
    end

    it "for wrong choice single character" do
      hangman.userInput = 'k'
      temp = hangman.missed_counter
      hangman.play
      (hangman.missed_counter - temp).should == 1
    end

    it "repeated characters count should be added to counter" do
      hangman.userInput = 'e'
      temp = hangman.counter
      hangman.play
      (hangman.counter - temp).should == 2
    end

    it 'correct input alphabet should exist in word_placeholder' do
      hangman.userInput = 'l'
      hangman.play
      hangman.word_placeholder.index('l').should_not == nil
    end

    it 'user input should have entry in previous_choice' do
      hangman.userInput = 'kk'
      hangman.play
      hangman.previous_choice.index('kk').should_not == nil
    end

  end


  it "should accept alphabet"

  context "#initialize" do
    it "counter should be 0" do
      expect( hangman.counter ).to eq(0)
    end
    it "counter should not be writable" do
      expect{ hangman.counter = 10 }.to raise_error NoMethodError
    end
    it "word_placeholder should be array of '_'" do
      expect(hangman.word_placeholder).to  eq(['_']*12)
    end
    it "word_placeholder length should be length of the word" do
      expect( hangman.word_placeholder.length).to eq(12)
    end
    it "missed_counter should be 0" do
      expect(hangman.missed_counter).to eq(0)
    end
    it "missed_counter should not be writable" do
      expect { hangman.missed_counter = 10 }.to raise_error NoMethodError
    end
    it "wrong_choice should be empty array" do
      expect( hangman.previous_choice.length).to eq(0)
    end
  end

  context "result" do
    context "win" do
      it "counter should be equal word length" do
        #expect(hangman.counter).to eq(12)
      end

    end
    context "loss" do
      it "missed_counter should be equal 6" do
        #expect( hangman.missed_counter).to eq(6)
      end
    end
  end
end
