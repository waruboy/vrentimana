class StaticPagesController < ApplicationController
  def index

  end

  def search
    @query = params[:q]
    @location = Geocoder.search(@query).first.data
    @lat = @location["geometry"]["location"]["lat"]
    @lng = @location["geometry"]["location"]["lng"]

    coordinate = [@lat, @lng]
    @stops = TjStop.near(coordinate, 1, units: :km)

  end
end
