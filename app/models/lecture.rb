class Lecture < ActiveRecord::Base
	# Ensures that when adding data from CSV files, there are no duplication of data
	validates_uniqueness_of :course_id, :course_name, :professor
	has_many :comments, dependent: :destroy
end
