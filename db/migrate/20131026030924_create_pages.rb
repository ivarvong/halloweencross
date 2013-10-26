class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :markdown
      t.string :slug
      t.hstore :past_slugs
      t.hstore :metadata
      t.string :title
      t.text :template
      t.text :html

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
