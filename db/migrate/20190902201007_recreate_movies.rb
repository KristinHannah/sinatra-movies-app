class RecreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title 
      t.string :release_date 
      t.string :genre 
      t.string :director 
      t.string :date_watched 
      t.string :location_watched 
      t.integer :rating 
      t.integer :user_id
  end
  end
end
