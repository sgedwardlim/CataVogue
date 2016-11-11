class LecturesController < ApplicationController
	before_action :authenticate_user!, :only => [:edit, :new, :create]
	def new
		@lecture = current_user.lectures.build
	end

	def create
		@lecture = current_user.lectures.build(lecture_params)

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
		params.require(:lecture).permit(:course_id, :course_name, :professor)
	end

end
