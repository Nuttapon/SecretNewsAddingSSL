class AddProvinceToNews < ActiveRecord::Migration
  def change
  	add_column :news , :province, :string
  	remove_column :news, :province_id
  end
end
