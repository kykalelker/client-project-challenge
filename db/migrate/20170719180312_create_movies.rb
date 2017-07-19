class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :lead_actor
      t.string :boxart_url
      t.integer :creator_id

      t.timestamps
    end
  end
end
