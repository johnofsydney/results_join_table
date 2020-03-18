class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.belongs_to :student
      t.belongs_to :course
      t.integer :score

      t.timestamps
    end
  end
end
