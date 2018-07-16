class Report < ApplicationRecord
	 belongs_to :survivor
	 validates :survivor_id, :survivor_id_report, presence: true
	 validates_uniqueness_of :survivor_id, :scope => :survivor_id_report

end
