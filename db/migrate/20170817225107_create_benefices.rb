class CreateBenefices < ActiveRecord::Migration[5.1]
  def change
    create_table :benefices do |t|
      t.string :estado
      t.date :fecha_vencimiento

      t.timestamps
    end
  end
end
