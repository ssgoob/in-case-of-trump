class LocationClient

  attr_reader :latitude, :longitude, :radius, :connection

  def initialize(latitude, longitude, radius)
    @connection ||= LocationAdapter.new(latitude, longitude, radius)
  end

  def create_recommendations
    connection.response_data.map do |rec|
      rec_hash = Hash.new
      rec_hash['name'] = rec['name']
      rec_hash['rating'] = rec['rating'] 
      rec_hash['price'] = rec['price level']
      rec_hash['id'] = rec['id']  
      rec_hash
    end
  end

end  
