class CreateLineups < ActiveRecord::Migration[7.1]
  def change
    create_table :lineups do |t|
      t.references :players, null: false, foreign_key: true

      t.timestamps
    end
  end
end
