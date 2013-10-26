class CreateHstore < ActiveRecord::Migration
  def change
    execute 'create extension hstore;'
  end
end
