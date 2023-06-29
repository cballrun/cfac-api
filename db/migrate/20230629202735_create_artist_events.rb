class CreateArtistEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :artist_events do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
