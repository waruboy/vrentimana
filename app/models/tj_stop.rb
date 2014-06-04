class TjStop < ActiveRecord::Base
  validates :google_lookup, presence: true
  validates :name, presence: true
  validates :corridor, presence: true

  belongs_to :corridor
  
  geocoded_by :google_lookup
  # after_validation :geocode, if: :google_lookup_changed?
end
