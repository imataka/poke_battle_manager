class CreateEvals < ActiveRecord::Migration
  def change
    create_table :evals do |t|
      t.integer :eval
      t.references :battle, index: true, foreign_key: true
      t.references :my_poke, index: true, foreign_key: true
      t.references :opp_poke, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
