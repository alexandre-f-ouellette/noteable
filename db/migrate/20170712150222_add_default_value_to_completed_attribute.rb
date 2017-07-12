class AddDefaultValueToCompletedAttribute < ActiveRecord::Migration[5.1]
  def up
    change_column :projects, :completed, :boolean, default: false
  end

  def down
    change_column :projects, :completed, :boolean, default: nil
  end
end
