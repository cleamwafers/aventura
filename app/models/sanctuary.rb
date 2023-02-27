class Sanctuary < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  has_many :impressions, dependent: :destroy
  has_many :favorites, dependent: :destroy

   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
