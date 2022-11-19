class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :title, null: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
