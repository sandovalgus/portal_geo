class AddCustomerToBenefice < ActiveRecord::Migration[5.1]
   def change
    add_reference :benefices, :customer, foreign_key: true
  end
end
