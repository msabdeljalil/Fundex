class Guess < ActiveRecord::Base
	belongs_to :round
	belong_to :card
end
