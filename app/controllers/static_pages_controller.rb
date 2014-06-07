class StaticPagesController < ApplicationController
  def index
  end

  def search
   @query = params[:q]
    @query_string = "#{@query}, Jakarta, Indonesia"
    result = Geocoder.search(@query_string, bounds: [[-6.0886599, 106.972825], [-6.3708331, 106.686211]])
    @success = !result.empty?
    if @success
      @location = result.first.data
      @lat = @location["geometry"]["location"]["lat"]
      @lng = @location["geometry"]["location"]["lng"]

      query = Query.create(
        text: @query,
        latitude: @lat,
        longitude: @lng
        )

      coordinate = [@lat, @lng]
      @stops = TjStop.near(coordinate, 1, units: :km)

      @hash = Gmaps4rails.build_markers(@stops) do |stop, marker|
        marker.lat stop.latitude
        marker.lng stop.longitude
        marker.infowindow "[TJ] #{stop.name}"
      end

      location_hash = {
        lat: @lat, lng: @lng, infowindow: @location["formatted_address"],
        picture: {
          url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=X|0000FF|FFFFFF", # up to you to pass the proper parameters in the url, I guess with a method from device
          width: 32,
          height: 32
        }
      }

      @hash << location_hash
    end

  end
end
