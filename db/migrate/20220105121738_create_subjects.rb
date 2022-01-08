class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :username
      t.string :subject_name
      t.integer :unattempted
      t.integer :attempted
      t.integer :solved

      t.timestamps
    end
  end
end
