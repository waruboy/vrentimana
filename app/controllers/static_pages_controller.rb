class StaticPagesController < ApplicationController
  def index

  end

  def search
    @query = params[:q]
    @location = Geocoder.search(@query).first.data
    @lat = @location["geometry"]["location"]["lat"]
    @lng = @location["geometry"]["location"]["lng"]


    @stops = TjStop.near([@lat, @lng], 1, units: :km)

  end
end
