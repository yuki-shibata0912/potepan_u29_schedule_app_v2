class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.text :memo

      t.timestamps
    end
  end
end
