class PlayerModel < ApplicationRecord
    validates :name, presence: true
    validates :obp, :avg, :slg, :ops, presence: true, numericality: true
end
