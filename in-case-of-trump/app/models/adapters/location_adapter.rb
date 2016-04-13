class LocationAdapter

  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def response
    binding.pry
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?&type=restaurant&location=#{latitude},#{longitude}&radius=50&key=AIzaSyBvQNt2nQGr5R1yyAB8_ymfyb_i6hDxtmo"
    response = HTTParty.get(url) #makes the request
  end

  def response_data
    binding.pry
    response['yelp_first_key']
  end  

end  


