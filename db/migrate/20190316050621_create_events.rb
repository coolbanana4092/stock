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
      t.string :starting_year
      t.string :starting_month
      t.string :starting_day
      t.string :starting_hour
      t.string :starting_minute
      t.string :ending_year
      t.string :ending_month
      t.string :ending_day
      t.string :ending_hour
      t.string :ending_minute
      t.string :content
      t.string :cautionary_note

      t.timestamps
    end
  end
end
