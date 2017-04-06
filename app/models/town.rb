class Town < ActiveRecord::Base
  
  before_validation :geocode
  
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
