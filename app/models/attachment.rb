class Attachment < ActiveRecord::Base
	belongs_to :lecture
	mount_uploader :link, LinkUploader
	validates :link, presence: true
end
