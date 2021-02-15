require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    def generate_code(number)
      charset = Array('A'..'Z')
      Array.new(number) { charset.sample }
    end
    varr = %w[A E I O U]
   @letters = generate_code(8) + varr.sample(2)

  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/"
    @word = params[:word]
    @wordarray = params[:word].upcase.split("")
    @newletters = (params[:letters].gsub(/\W/, "")).split("")
    @test = @wordarray & @newletters == @wordarray
        url = "https://wagon-dictionary.herokuapp.com/#{@word}"
        user = open(url).read
        user = JSON.parse(user)

      if user["found"] == false
        @response = "Sorry but #{@word} does not seem to be a valid English word..."
      elsif @wordarray & @newletters != @wordarray
      @response = "Sorry, #{@word} can't be built out of #{@newletters.join(" ")}"
    else
      @response = "Congratulations! #{@word.upcase} is a valid English word!"
      end


  url = "https://wagon-dictionary.herokuapp.com/#{@word}"
  user_serialized = open(url).read
  JSON.parse(user_serialized)

  end



end

