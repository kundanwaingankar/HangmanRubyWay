require './Hangman'
describe Hangman   do
  subject(:hangman){ Hangman.new("elephantisis")}
  it "should accept only 1 character"
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
      expect( hangman.wrong_choice.length).to eq(0)
    end
  end
  context "for correct choice" do

  end
  context "for wrong choice" do

  end
  context "for repeated character" do

  end
  context "result" do
      context "win" do

      end
      context "loss" do

      end
  end
end
