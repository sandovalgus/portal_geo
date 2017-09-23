class HomeController < ApplicationController
before_action :authenticate_user!
  def home
  	@customers= Customer.includes(:addresses).all
    @addres = Address.all

    string = ""
    @map_hash = Gmaps4rails.build_markers(@addres) do |address, marker|
     customer = Customer.select(:nombre, :apellido, :n_socio, :estado).where(:id => address.customer_id).last
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(:partial => "customers/info", :locals =>{:address => address, :customer => customer})
    end
end


# testeando cruzada de areas con clientes
  #   @zone= Zone.all
  #   @polyjson = []
  #   schoolpoints = []
  #   @zone.each do |zone|
  #     CoordinateZone.where(:zone_id => zone.id).each do |point|
  #        schoolpoints << { :zone => point.zone_id,  :lng => point.longitud, :lat => point.latitud}
  #     end
  #   end

  #   @polyjson = schoolpoints
  #   @polyjson = @polyjson.to_json
  # end
end
