class RemoveWeekFromDays < ActiveRecord::Migration[5.2]
  def change
    remove_column :days, :week_id
  end
end
