class Idea < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_votable
  mount_uploader :image, ImageUploader

  belongs_to :user

  def normalize_friendly_id(title)
    title.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
