class LocationClient

  attr_reader :query, :connection

  def initialize
    @query = query
    @connection ||= LocationConnection.new(query)
  end

  def create_recommendations
    connection.response_data.map do |rec|
      dining = rec['rating']
      parks = rec['green_stuff']
      city = rec['name']
      # weather...
      Location.create(dining: dining, parks: parks, city: city)
    end
  end

end  