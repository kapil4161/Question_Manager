class AddSinputUinputSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :sinput, :string 
    add_column :subjects, :uinput, :string 
  end
end
