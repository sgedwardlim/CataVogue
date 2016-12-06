class AttachmentsController < ApplicationController

  def show
    @attachment = Attachment.find(params[:id])
  end

  def new
  end

  def create
  	@lecture = Lecture.find(params[:lecture_id])
  	@attachment = @lecture.attachments.create(attachment_params)
  	
  	if @attachment.save
  	 redirect_to lecture_path(@lecture), notice: "The attachment has been uploaded."
    else 
      redirect_to lecture_path(@lecture), alert: "Please make sure to upload an Image first."
    end
  end

  def update
  end

  def destroy
  end

  private

	def attachment_params
		params.require(:attachment).permit(:lecture_id, :link)
	end
end
