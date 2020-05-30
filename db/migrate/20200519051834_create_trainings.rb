class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :content
      t.date :date
      t.integer :kg1
      t.integer :rep1
      t.integer :kg2
      t.integer :rep2
      t.integer :kg3
      t.integer :rep3
      t.integer :kg4
      t.integer :rep4
      t.integer :kg5
      t.integer :rep5
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
