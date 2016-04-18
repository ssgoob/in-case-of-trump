class LocationAdapter

  attr_reader :latitude, :longitude, :radius

  def initialize(latitude, longitude, radius = 50)
    @latitude = latitude
    @longitude = longitude
    @radius = radius
  end

  def response
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?&type=restaurant&location=#{latitude},#{longitude}&radius=#{radius}&key=AIzaSyCL2ebVt1jDeEyewMeiB0J-ydwqi8LqP0A"
    response = HTTParty.get(url) #makes the request
  end

  def response_data
    response['results']
  end  

end  