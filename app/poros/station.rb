class Station
  attr_reader :name, :address, :fuel_type_code, :access_days_time, :distance, :travel_time, :directions

  def initialize(attr)
    @name = attr[:station_name]
    @address = [
      attr[:street_address],
      attr[:city],
      attr[:state],
      attr[:zip]].join(', ')
    @fuel_type_code = attr[:fuel_type_code]
    @access_days_time = attr[:access_days_time]
    @distance = attr[:distance]
    @travel_time = attr[:travel_time]
    @directions = attr[:directions]
  end
end
