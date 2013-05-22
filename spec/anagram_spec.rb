require File.join(File.dirname(__FILE__), '..', 'anagram.rb')

describe Anagram do
  let(:anagram) { Anagram.new }

  it { should respond_to(:solve)}

  it "one word should return ['a']" do
    expect(anagram.solve(['a'])).to eq([['a']])
  end

  it "two words should return [['a'], ['b']]" do
    expect(anagram.solve(['a', 'b'])).to eq([['a'], ['b']])
  end

  it "two equals words should return one" do
    expect(anagram.solve(['a', 'a'])).to eq([['a']])
  end

  it "should return ['star']" do
    expect(anagram.solve(['star'])).to eq([['star']])
  end

  it "should not be casesensitive" do
    expect(anagram.solve(['Star', 'star'])).to eq([['star']])
  end

  it "should return one group of anagrams" do
    expect(anagram.solve(['star', 'rats'])).to eq([['star', 'rats']])
  end

  it "should return two groups" do
    expect(anagram.solve(['star', 'rats', 'army'])).to eq([['star', 'rats'], ['army']])
  end

  it "should return two groups with two words each" do
    expect(anagram.solve(['star', 'mary', 'rats', 'tars', 'army'])).to eq([['star', 'rats', 'tars'], ['mary', 'army']])
  end

  it "should raise an ArgumentError expection" do
    expect { anagram.solve("star") }.to raise_error(ArgumentError, "Argument is not an array")
  end
end
