class LecturesController < ApplicationController
	def new
	end

	def create
		@lecture = Lecture.new(lecture_params)

		@lecture.save
		redirect_to @lecture
	end

	def index
		@lectures = Lecture.all
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
