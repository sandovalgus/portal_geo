class HomeController < ApplicationController
before_action :authenticate_user!
  def home
  	@customers= Customer.includes(:addresses).all
    @addres = Address.all

    @map_hash = Gmaps4rails.build_markers(@addres) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow [address.address,"</br>", address.latitude,address.latitude].join('-')
    end


# testeando cruzada de areas con clientes
    @zone= Zone.all
    @polyjson = []
    schoolpoints = []
    @zone.each do |zone|
      CoordinateZone.where(:zone_id => zone.id).each do |point|
         schoolpoints << { :zone => point.zone_id,  :lng => point.longitud, :lat => point.latitud}
      end
    end
    puts "********schoolpoints***********"
    puts schoolpoints.inspect

    @polyjson = schoolpoints
    @polyjson = @polyjson.to_json
  end
end
