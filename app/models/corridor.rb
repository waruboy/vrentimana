class Corridor < ActiveRecord::Base
  validates :number, presence: true
end
