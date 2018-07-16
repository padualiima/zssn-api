class Survivor < ApplicationRecord
	validates :name, uniqueness: true
	validates :name, :age, :gender, :latitude, :longitude, presence: true
	has_one :inventory
	accepts_nested_attributes_for :inventory

	has_many :reports
end
