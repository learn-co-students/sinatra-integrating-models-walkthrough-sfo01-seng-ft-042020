require 'pry'
require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @count_words = @analyzed_text.count_of_words
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    common = @analyzed_text.most_used_letter.flatten
    @most_use_letter = common[0].upcase
    @use_count = common[1]

    erb :results
  end
end
