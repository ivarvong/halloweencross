class CreatePagePhotos < ActiveRecord::Migration
  def change
    create_table :page_photos do |t|
      t.integer :photo_id
      t.integer :page_id
      t.integer :order
      t.hstore :data

      t.timestamps
    end
    add_index :page_photos, :photo_id
    add_index :page_photos, :page_id
    add_index :page_photos, :order
  end
end
