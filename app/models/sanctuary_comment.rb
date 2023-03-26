class SanctuaryComment < ApplicationRecord
  belongs_to :sanctuary
  belongs_to :user
  validates :comment, presence: true
end
