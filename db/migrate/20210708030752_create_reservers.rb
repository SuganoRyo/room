class CreateReservers < ActiveRecord::Migration[6.1]
  def change
    create_table :reservers do |t|
      t.date :start
      t.date :end
      t.integer :number
      t.integer :total
      t.integer :user_id

      t.timestamps
    end
  end
end
