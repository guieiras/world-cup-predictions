class RemoveDateRangeFromMatchdays < ActiveRecord::Migration[5.2]
  def change
    remove_column :matchdays, :started_at, :datetime
    remove_column :matchdays, :ended_at, :datetime
  end
end
