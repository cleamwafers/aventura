class Tag < ApplicationRecord
  has_many :sanctuary_tags, dependent: :destroy
end
