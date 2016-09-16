class CommentsController < ApplicationController
	def new
	end

	def create
		@reviews = @lecture.comments.create(comment_params)
		@lecture = Lectures.find(params[:lecture_id])

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
		params.require(:comment).permit(:reviwer, :review)
	end
end
