class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :logo
      t.string :spotify_url
      t.string :instagram_url

      t.timestamps
    end
  end
end
