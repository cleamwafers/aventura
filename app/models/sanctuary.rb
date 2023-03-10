class Sanctuary < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  has_many :impressions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def get_image(width,height)
    unless image.attached?
     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end

  geocoded_by :address
  after_validation :geocode
end
