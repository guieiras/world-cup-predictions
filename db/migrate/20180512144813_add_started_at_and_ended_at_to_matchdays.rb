class AddStartedAtAndEndedAtToMatchdays < ActiveRecord::Migration[5.2]
  def change
    remove_column :matchdays, :name, :string
    remove_column :matchdays, :finished, :boolean
    add_column :matchdays, :started_at, :datetime
    add_column :matchdays, :ended_at, :datetime
  end
end
