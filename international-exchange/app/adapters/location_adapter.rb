class LocationAdapter

  attr_reader :latitude, :longitude, :radius

  def initialize(latitude, longitude, radius = 50)
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


