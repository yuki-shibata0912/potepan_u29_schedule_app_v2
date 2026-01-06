class AddAllDayToSchedules < ActiveRecord::Migration[7.2]
  def change
    add_column :schedules, :all_day, :boolean
  end
end
