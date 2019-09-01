class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies |t|
      t.string :title 
      t.string :release_date 
      t.string :genre 
      t.string :director 
      t.string :date_watched 
      t.string :location_watched 
      t.integer :rating 
  end
  end
end
