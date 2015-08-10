class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_many :answers
   mount_uploader :file, Uploader
end
