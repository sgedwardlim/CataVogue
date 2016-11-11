require 'csv'

namespace :import do

	desc "Import lecture data from csv"
	task lectures: :environment do
		# Get the full path to where the csv file exist
		filename = File.join Rails.root, "sjsucourses.csv"
		# Use built in csv methods provided by rails to parse data from csv file
		CSV.foreach(filename) do |row|
			# Store items in each column into a variables
			course_id, course_name, start_date, end_date, professor = row
			# dont include .create!() because we dont want any duplicates in our database
			Lecture.create(course_id: course_id, course_name: course_name, professor: professor)
			p row
		end
	end
end