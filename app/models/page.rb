class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(title)
    title.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
