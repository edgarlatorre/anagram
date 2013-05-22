class Anagram
  def solve(words)
    raise ArgumentError, "Argument is not an array" unless words.is_a?(Array)
    anagrams = Hash.new

    words.uniq.each do |word|
      word = word.downcase
      key = word.chars.sort.join
      anagrams[key] = Array.new unless anagrams.has_key?(key)
      anagrams[key].push(word) unless anagrams[key].include?(word)
    end

    anagrams.values
  end
end
