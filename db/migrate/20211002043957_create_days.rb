class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.boolean :populated, default: false
      t.boolean :cancelled, default: false
      t.belongs_to :request
      t.belongs_to :week
      t.text :start_time, default: ""
      t.text :end_time, default: ""
      t.integer :cp1, default: 1
      t.integer :cp2, default: 1
      t.decimal :mp1, default: 0.0
      t.decimal :mp2, default: 0.0
      t.boolean :MT1, default: false
      t.boolean :MT2, default: false
      t.boolean :MT3, default: false
      t.boolean :MT4, default: false
      t.boolean :other, default: false
      t.boolean :taw, default: false
      t.boolean :form_b, default: false
      t.boolean :form_c, default: false
      t.boolean :track_and_time, default: false
      t.boolean :inacc_track, default: false
      t.boolean :single_track, default: false
      t.string :briefing_time, default: ""
      t.string :briefing_location, default: ""
      t.string :briefing_name, default: ""
      t.string :briefing_number, default: ""
      t.string :worker_primary, default: "-"
      t.string :worker_secondary1, default: "-"
      t.string :worker_secondary2, default: "-"
      t.string :worker_secondary3, default: "-"
      t.string :worker_secondary4, default: "-"
      t.string :worker_secondary5, default: "-"
      t.text :requestor_notes, default: ""
      t.text :admin_notes, default: ""
      t.text :inspector_notes, default: ""
      t.string :approval_group_1, default: "pending"
      t.string :approval_group_2, default: "pending"
      t.string :approval_group_3, default: "pending"
      t.string :approval_group_4, default: "pending"

    end
  end
end
