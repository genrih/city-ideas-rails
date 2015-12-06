class Idea < ActiveRecord::Base
  acts_as_votable
  mount_uploader :image, ImageUploader

  belongs_to :user
end
