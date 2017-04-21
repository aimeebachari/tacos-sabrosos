class AddUserToTacoShops < ActiveRecord::Migration[5.0]
  def change
    add_column :taco_shops, :user_id, :integer
  end
end
