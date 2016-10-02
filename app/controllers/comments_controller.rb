class CommentsController < ApplicationController
	before_action :authenticate_user!, :only => [:edit, :new, :create]
	def new
	end

	def create
		@lecture = Lecture.find(params[:lecture_id])
		@reviews = @lecture.comments.create(comment_params)
		
		@reviews.save
		redirect_to lecture_path(@lecture)
	end

	def index
		@reviews = Comment.all
	end

	def show
		@reviews = Comment.find(params[:id])
	end

	def save
	end

	private

	def comment_params
		params.require(:comment).permit(:reviewer, :review)
	end
end
