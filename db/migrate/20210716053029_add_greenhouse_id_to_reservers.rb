class AddGreenhouseIdToReservers < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservers, :greenhouse, foreign_key: true
  end
end
