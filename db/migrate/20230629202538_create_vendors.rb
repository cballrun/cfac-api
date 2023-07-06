class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :description
      t.string :logo

      t.timestamps
    end
  end
end
