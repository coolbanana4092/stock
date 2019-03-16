class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :genre
      t.string :organizer
      t.string :place
      t.string :ticket_name
      t.string :price
      t.string :starting_time
      t.string :ending_time
      t.string :content
      t.string :cautionary_note

      t.timestamps
    end
  end
end
