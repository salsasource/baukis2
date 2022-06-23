class ChangeStringToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :staff_members, :start_date, "date USING start_date::date"
    change_column :staff_members, :end_date, "date USING start_date::date"
  end
end
