class Place < ApplicationRecord

  attr_accessor :raw_address
  geocoded_by :raw_address
  after_validation lambda {
    self.address = raw_address
    geocode
  }, if: ->(obj) { obj.raw_address.present? && obj.raw_address != obj.address }
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
                   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }

end
