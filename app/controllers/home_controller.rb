class HomeController < ApplicationController
before_action :authenticate_user!
 respond_to :html, :json, :js
  def home
   palabra = "%#{params["search"]}%"
    if params[:search].nil?
      # sin busqueda
      @customers= Customer.includes(:addresses).all
    else
      #con busqueda
     @customers= Customer.includes(:addresses).where("nombre =LIKE ?", palabra)
    end


  	
    @addres = Address.all

    string = ""
    @map_hash = Gmaps4rails.build_markers(@addres) do |address, marker|
     customer = Customer.select(:nombre, :apellido, :n_socio, :estado).where(:id => address.customer_id).last
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(:partial => "customers/info", :locals =>{:address => address, :customer => customer})
    end


end

def search
   palabra = "%#{params[:search]}%"
    if params[:search].nil?
      # sin busqueda
      @customers= Customer.includes(:addresses).all
    else
      #con busqueda
     @customers= Customer.includes(:addresses).where("nombre LIKE ?", palabra)
    end
    respond_to do |format|
        # format.json { render :json => @customers }
        format.js
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
