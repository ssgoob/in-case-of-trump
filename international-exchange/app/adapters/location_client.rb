class LocationClient

  
  attr_reader :latitude, :longitude, :radius

  def initialize(latitude, longitude, radius = 50)
    @latitude = latitude
    @longitude = longitude
    @radius = radius
    @connection ||= LocationAdapter.new(latitude, longitude, radius)
  end

# an array of objects or hashes
  def recommendations
    @recommendations = []
    @connection.response_data.map do |rec|
      recommendation = {}
      recommendation['name'] = rec["name"]
      recommendation['rating'] = rec["rating"] 
      recommendation['price'] = rec["price_level"]
      recommendation['address'] = rec["vicinity"]
      @recommendations << recommendation
    end
    @recommendations
  end
  
  
end  




# test = LocationClient.new(40.685722, -73.952905)
# test = LocationClient.new(40.685722, -73.952905, 500)



 # @latitude=43.97682496107221,
 #   @longitude=27.84500718141999,
 #   @radius=1000000>,
 # url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?&type=restaurant&location=43.97682496107221,27.84500718141999&radius=10000&key=AIzaSyBvQNt2nQGr5R1yyAB8_ymfyb_i6hDxtmo"


 # @latitude=46.39918096766364,
 #   @longitude=30.06804804829307,
 #   @radius=10000>,
