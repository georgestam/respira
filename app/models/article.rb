class Article < ApplicationRecord
     
  extend FriendlyId
  
  LANGUAGES = ['ea', 'en']
  
  validates :title, :description, presence: true, length: { minimum: 10 }
  validates :locale,  inclusion: { in: LANGUAGES, allow_nil: false }
  
  friendly_id :title, use: :slugged
                                  
  mount_uploader :photo, PhotoUploader
  
  private
  
  def locale_enum
     ['ea','en']
  end

end

