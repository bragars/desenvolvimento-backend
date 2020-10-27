class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :uf
      t.string :state
      t.string :cases
      t.string :deaths
      t.string :date

      t.timestamps
    end
  end
end
