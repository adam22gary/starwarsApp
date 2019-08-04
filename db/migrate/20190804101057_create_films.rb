class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.text :opening_crawl
      t.string :director
      t.string :producer
      t.date :release_date
      t.string :characters
      t.string :planets
      t.string :starships
      t.string :vehicles
      t.string :species
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
