class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :short_description, null: false
      t.string :description, null: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
