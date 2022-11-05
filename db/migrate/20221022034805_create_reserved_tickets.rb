class CreateReservedTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :reserved_tickets do |t|

      t.timestamps
    end
  end
end
