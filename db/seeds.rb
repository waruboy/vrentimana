require 'csv'

filename = "db/seeds/tj_stops.csv"


[*1..11].each { |num| Corridor.create(number: num) }


CSV.foreach(filename, headers: true) do |row|
  stop = row.to_hash
  TjStop.create(
    name: stop["name"],
    google_lookup: stop["name"],
    latitude: stop["latitude"],
    longitude: stop["longitude"],
    corridor_id: Corridor.find_by_number(stop["corridor"]).id

    )
end