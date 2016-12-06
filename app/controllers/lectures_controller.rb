class LecturesController < ApplicationController
	before_action :authenticate_user!, :only => [:edit, :new, :create]
	
	def create
		@lecture = current_user.lectures.build(lecture_params)

		@lecture.save
		redirect_to @lecture
	end

	def index
		@lectures = Lecture.all
		if params[:search]
		    @lectures = Lecture.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
		else
			@lectures = Lecture.all.paginate(:page => params[:page], :per_page => 50)
		end
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
		@attachments = Attachment.all.paginate(:page => params[:page], :per_page => 6)
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
