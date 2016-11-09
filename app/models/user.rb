class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :lectures, dependent: :destroy

  validates_format_of :email, with: /\@sjsu\.edu/, message: 'address should be from SJSU.edu'
end
