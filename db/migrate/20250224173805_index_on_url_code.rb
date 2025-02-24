class IndexOnUrlCode < ActiveRecord::Migration[8.0]
  def change
    add_index :urls, :code, unique: true
  end
end
