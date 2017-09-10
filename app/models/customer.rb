require 'address'
class Customer < ApplicationRecord
	belongs_to :zone,  required: false
	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses
									# reject_if: proc {|attributes| attributes['name'].blank?},
									# allow_destroy:true
	def self.import(file)
	# 10000,GRAL.RAMIREZ 1968,POSADAS,Misiones,3
		actualizado = 1
		CSV.foreach(file.path, headers: false) do | row |
			c =  Customer.where(:n_socio => row[0]).first
			if (c)
				c.estado = row[4]
				puts ("update ... " + actualizado.to_s)
				actualizado+=1
			else
			c = Customer.new(:n_socio => row[0])
			c.estado = row[4]
			direccion = row[1].to_s , row[2].to_s ,  row[3].to_s
			puts direccion
			c.addresses.build(:address => direccion)
			end

			c.save
			# puts a.inspect
			
		end

	end


end







