class SanctuaryComment < ApplicationRecord
  belongs_to :sanctuary
  belongs_to :user
end
