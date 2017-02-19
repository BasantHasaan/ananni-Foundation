class CreateLooms < ActiveRecord::Migration[5.0]
  def change
    create_table :looms do |t|
      t.integer :reference
      t.string :workshop
      t.references :workshop, foreign_key: true


      t.timestamps
    end
  end
end
