class TjStop < ActiveRecord::Base
  validates :google_lookup, presence: true
  geocoded_by :google_lookup
  after_validation :geocode, if: :google_lookup_changed?
end
