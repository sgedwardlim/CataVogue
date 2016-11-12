require 'csv'

namespace :import do

	desc "Import lecture data from csv"
	task lectures: :environment do
		# Get the full path to where the csv file exist
		filename = File.join Rails.root, "sjsucourses.csv"
		# counter for num of items added to database
		counter = 0
		# Use built in csv methods provided by rails to parse data from csv file
		CSV.foreach(filename) do |row|
			# Store items in each column into a variables
			course_id, course_name, start_date, end_date, professor = row
			# possibility of duplicated data is handled in models/lecture.rb
			lecture = Lecture.create(course_id: course_id, course_name: course_name, professor: professor)
			counter += 1 if lecture.persisted?
		end

		puts "Imported #{counter} lectures"
	end
end