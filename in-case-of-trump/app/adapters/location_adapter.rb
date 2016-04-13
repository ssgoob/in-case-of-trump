class LocationAdapter

  attr_reader :latitude, :longitude, :radius

  def initialize(latitude, longitude, radius)
    @latitude = latitude
    @longitude = longitude
    @radius = radius
  end

  def response
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?&type=restaurant&location=#{latitude},#{longitude}&radius=#{radius}&key=AIzaSyBvQNt2nQGr5R1yyAB8_ymfyb_i6hDxtmo"
    response = HTTParty.get(url) #makes the request
  end

  def response_data
    response['results']
  end  

end  


# https://maps.googleapis.com/maps/api/place/nearbysearch/json?type=point_of_interest&location=40.7049829,-74.01363769999999&radius=500&key=AIzaSyBvQNt2nQGr5R1yyAB8_ymfyb_i6hDxtmo

# https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.7049829,-74.01363769999999&radius=500&type=restaurant&key=AIzaSyBvQNt2nQGr5R1yyAB8_ymfyb_i6hDxtmo

# 40.7049829,-74.01363769999999

# https://maps.googleapis.com/maps/api/place/nearbysearch/json?&type=restaurant&location=35.84100157116834,-86.74923908637521&radius=5000&key=AIzaSyBvQNt2nQGr5R1yyAB8_ymfyb_i6hDxtmo


# https://maps.googleapis.com/maps/api/place/nearbysearch/json?&type=restaurant&location=41.35658218277947,-98.60409789450667&radius=5000&key=AIzaSyBvQNt2nQGr5R1yyAB8_ymfyb_i6hDxtmo