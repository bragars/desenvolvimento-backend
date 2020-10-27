class CreateStateTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :state_times do |t|
      t.string :uf
      t.string :state
      t.string :cases
      t.string :deaths
      t.string :date

      t.timestamps
    end
  end
end
