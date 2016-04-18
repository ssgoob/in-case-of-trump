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