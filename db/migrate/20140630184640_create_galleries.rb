class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.text :description
      t.timestamps #creates t.datetime for created_at and updated_at dates
    end
  end
end
 