class ChangeDatatypeForSubjects < ActiveRecord::Migration[6.1]
  def change
    change_column :subjects, :unattempted, :string 
    change_column :subjects, :attempted, :string 
    change_column :subjects, :solved, :string 
  end
end
