require 'address'
class Customer < ApplicationRecord
	belongs_to :zone,  required: false
	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses
									# reject_if: proc {|attributes| attributes['name'].blank?},
									# allow_destroy:true
	def self.import(file)
	# 10000,GRAL.RAMIREZ 1968,POSADAS,Misiones,3

		CSV.foreach(file.path, headers: false) do | row |
			#puts row[0].inspect + "	" + row[1].inspect + "	" + row[2].inspect + "	" + row[3].inspect + "	" + row[4].inspect
			c = Customer.new(:n_socio => row[0])
			# c.addresses.build
			# a = Address.new
			# c.n_socio = row[0]
			c.estado = row[4]
			puts row[1].inspect 
			direccion = row[1] , row[2] , row[3]
			c.addresses.build(:address => direccion)
			# c.addresses = row[1].to_str + ". " + row[2].to_str + ", " + row[3].to_str
			# a.customer = c.id
			c.save
			# puts a.inspect
			
		end

	end


end







