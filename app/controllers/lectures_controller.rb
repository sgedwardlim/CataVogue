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

	def edit
	  @lecture = Lecture.find(params[:id])
	end

	def update
		@lecture = Lecture.find(params[:id])

		if @lecture.update(lecture_params)
			redirect_to @lecture
		else
			render 'edit'
		end
	end

	def show
		@lecture = Lecture.find(params[:id])
	end

	def save
	end

	def destroy
	  @lecture = Lecture.find(params[:id])
	  @lecture.destroy
	 
	  redirect_to lectures_path
	end

	private

	def lecture_params
		params.require(:lecture).permit(:name, :professor)
	end

end
