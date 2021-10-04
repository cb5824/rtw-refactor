class AddNumInWeekToDays < ActiveRecord::Migration[5.2]
  def change
    add_column :days, :num_in_week, :integer, null: false
  end
end
