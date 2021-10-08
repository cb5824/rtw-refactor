class AddFieldsToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :project, :string, null: false
    add_column :requests, :work_directive, :string, null: false
    add_column :requests, :title, :string, null: false
    add_column :requests, :description, :string, null: false
    add_column :requests, :sswps, :string, null: false
    add_column :requests, :change_notices, :string, null: false
    add_column :requests, :rwp, :boolean, null: false, default: false
    add_column :requests, :ocs, :boolean, null: false, default: false
    add_column :requests, :disturb, :boolean, null: false, default: false
    add_column :requests, :rrm, :boolean, null: false, default: false
    add_column :requests, :foul, :boolean, null: false, default: false
    add_column :requests, :crossings, :boolean, null: false, default: false
    add_column :requests, :underground, :boolean, null: false, default: false
    add_column :requests, :flagging, :boolean, null: false, default: false
    add_column :requests, :requestor_name, :string, null: false

  end
end
