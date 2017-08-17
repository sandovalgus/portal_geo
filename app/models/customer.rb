class Customer < ApplicationRecord
	belongs_to :zone,  required: false
	belongs_to :benefice , required: false
	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses
									# reject_if: proc {|attributes| attributes['name'].blank?},
									# allow_destroy:true


end







