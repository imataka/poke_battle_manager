class CreateEvals < ActiveRecord::Migration
  def change
    create_table :evals do |t|
      t.integer :eval
      t.references :battle, index: true, foreign_key: true
      t.string :my_poke
      t.string :references
      t.references :opp_poke, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
