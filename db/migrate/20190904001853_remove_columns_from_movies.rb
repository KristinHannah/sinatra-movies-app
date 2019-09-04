class RemoveColumnsFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :release_date, :string
    remove_column :movies, :genre, :string 
    add_column :movies, :review, :string 
  end
end


