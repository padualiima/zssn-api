class Report < ApplicationRecord
	 belongs_to :survivor
	 validates :survivor_id, presence: true


end
