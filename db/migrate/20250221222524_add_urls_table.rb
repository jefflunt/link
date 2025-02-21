class AddUrlsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :urls, id: :uuid do |t|
      t.text :dest, null: false
      t.string :code, null: false
    end
  end
end
