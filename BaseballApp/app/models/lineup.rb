class Lineup < ApplicationRecord
  belongs_to :player_model

  validates :position, presence: true, inclusion: { in: 1..9 }
  validates_uniqueness_of :player_model_id
end
