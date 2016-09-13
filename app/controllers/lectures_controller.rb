class LecturesController < ApplicationController
	def new
	end

	def create
		@lecture = Lecture.new(lecture_params)

		@lecture.save
		redirect_to @leture
	end

	def index
	end

	def show
		@lecture = Lecture.find(params[:id])
	end

	def save
	end

	private

	def lecture_params
		params.require(:lecture).permit(:name, :professor)
	end

end
