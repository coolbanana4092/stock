class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :email
      t.text :message, limit: 2000

      t.timestamps
    end
  end
end
