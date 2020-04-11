class Dictionary
  attr_reader :contents

  def initialize(url="https://www.scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt")
    @contents = read_dictionary_file(url)
  end

  public

  def random_word
    select_words_by_length[rand(0..select_words_by_length.length)]
  end

  def select_words_by_length(range=(4..9))    #4-9 is the default range of word lengths
    contents.select{ |word| (word.length >= range.first) && (word.length <= range.last) }
  end

  private

  def read_dictionary_file(url)
    URI.open(url).read.split
  end

end
  
  
