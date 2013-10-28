class AddSortOrderToPagePhotos < ActiveRecord::Migration
  def change
    add_column :page_photos, :sort_order, :integer
  end
end
