class CreatePlayerModels < ActiveRecord::Migration[7.1]
  def change
    create_table :player_models do |t|
      t.string :name
      t.float :obp
      t.float :avg
      t.float :slg
      t.float :ops

      t.timestamps
    end
  end
end
