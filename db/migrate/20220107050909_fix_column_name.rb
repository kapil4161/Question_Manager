class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :subjects, :uinput, :ainput
  end
end
