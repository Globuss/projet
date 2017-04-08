class Town < ActiveRecord::Base
  
  before_validation :geocode
  
  public
  
  def laMeteo
    ForecastIO.forecast(self.latitute, self.longitude,params: { units: 'si' })
  end
  
  
  private
  
    def geocode
      places = Nominatim.search(self.nom).limit(1)
      
        place = places.first
      if place
        self.longitude = place.longitude
        self.latitute = place.latitude
      end
    end
  
  
  
end
