class CreateTacoShops < ActiveRecord::Migration[5.0]
  def change
    create_table :taco_shops do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :description

      t.timestamps
    end
  end
end
