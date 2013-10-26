class AddBucketToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :bucket, :string
  end
end
