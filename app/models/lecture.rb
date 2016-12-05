class Lecture < ActiveRecord::Base
	# Ensures that when adding data from CSV files, there are no duplication of data
	# WRONG! validates_uniqueness_of :course_id, :course_name, :professor
	validates_uniqueness_of :course_id, :scope => [:course_name, :professor]
	has_many :comments, dependent: :destroy
	has_many :attachments, dependent: :destroy

	def self.search(search)
	  where("professor LIKE ? OR course_name LIKE ? OR course_id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
