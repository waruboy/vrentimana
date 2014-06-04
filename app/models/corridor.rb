class Corridor < ActiveRecord::Base
  validates :number, presence: true

  has_many :tj_stops
end
