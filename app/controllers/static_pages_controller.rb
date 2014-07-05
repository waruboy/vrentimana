class StaticPagesController < ApplicationController
  def index
    @radius = '1'
  end

  def search
    @query = params[:q]
    @radius = params[:radius]
    @query_string = "#{@query}"
    results = Geocoder.search(@query_string, bounds: [[-6.0886599, 106.972825], [-6.3708331, 106.686211]])
    subtractor  = []
    results.each do |result|
      if !check_in_jakarta(result.data)
        subtractor += [result]
      end
    end

    @results = results - subtractor

    @success = !@results.empty?
    if @success
      index = params[:location_index] ? params[:location_index] : 0 
      index = index.to_i
      @location = @results[index].data
      @lat = @location["geometry"]["location"]["lat"]
      @lng = @location["geometry"]["location"]["lng"]

      @other_results = @results - [@results[index]]
      @results_hash = Hash[@results.map.with_index.to_a]


      query = Query.create(
        text: @query,
        latitude: @lat,
        longitude: @lng
        )

      coordinate = [@lat, @lng]
      
      @stops = TjStop.near(coordinate, @radius, units: :km)

      @stops.reload
      if @stops.empty?
        @radius = '3' 
        @stops = TjStop.near(coordinate, @radius, units: :km)
        @stops.reload
      end

      if @stops.empty?
        @radius = '5' 
        @stops = TjStop.near(coordinate, @radius, units: :km)
      end

      @hash = Gmaps4rails.build_markers(@stops) do |stop, marker|
        marker.lat stop.latitude
        marker.lng stop.longitude
        marker.infowindow "[TJ] K#{stop.corridor.number}. #{stop.name} (#{stop.distance_string})"
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
      gon.stops = @stops
    end

  end
end

private

  def check_in_jakarta(location)

    latitude = location["geometry"]["location"]["lat"]
    longitude = location["geometry"]["location"]["lng"]

    latitude_ok = latitude < -6.0886599 && latitude > -6.3708331
    longitude_ok = longitude < 106.972825 && longitude > 106.686211

    if latitude_ok && longitude_ok
      true
    else
      false
    end
  end


