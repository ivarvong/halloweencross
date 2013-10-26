class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.hstore :iptc
      t.hstore :data
      t.string :caption
      t.string :byline
      t.hstore :sizes
      t.string :s3_key

      t.timestamps
    end
  end
end
