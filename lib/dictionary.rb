class Dictionary
  attr_reader :contents

  def initialize(path)
    @contents = read_file(path)
  end

  public

  def random_word
    select_words_by_length[rand(0..select_words_by_length.length)]
  end

  def select_words_by_length(range=(4..9))    #4-9 is the default range of word lengths
    contents.select{ |word| (word.length >= range.first) && (word.length <= range.last) }
  end

  private

  def read_file(path)
    File.open(path).readlines
  end

end
  
  
