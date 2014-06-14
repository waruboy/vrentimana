class TjStop < ActiveRecord::Base
  validates :google_lookup, presence: true
  validates :name, presence: true
  validates :corridor, presence: true

  belongs_to :corridor
  
  geocoded_by :google_lookup
  # after_validation :geocode, if: :google_lookup_changed?

  def distance_in_m
    (distance.round(1) * 1000).round(0)
  end

  def distance_string
    if distance >= 1
      "#{distance.round(1)} km"
    else
      "#{distance_in_m} m"
    end

  end
end
