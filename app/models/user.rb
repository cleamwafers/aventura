class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :sanctuarys, dependent: :destroy
  has_many :impressions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :sanctuary_comments, dependent: :destroy

 def active_for_authentication?
    super && (is_deleted == false)
 end

  def get_image(width,heigth)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, heigth]).processed
  end

  validates :name, presence: true
end
