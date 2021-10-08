class AddAdditionalSecondariesToDays < ActiveRecord::Migration[5.2]
  def change
    add_column :days, :worker_secondary6, :string, default: "-"
    add_column :days, :worker_secondary7, :string, default: "-"
    add_column :days, :worker_secondary8, :string, default: "-"
    add_column :days, :worker_secondary9, :string, default: "-"
  end
end
