class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.timestamps null: false
      t.belongs_to :user, index: true
      t.integer :year, null: false
      t.belongs_to :week, index: true
      t.string :contractor, null: false
      t.string :status, default: "pending"
    end
  end
end
