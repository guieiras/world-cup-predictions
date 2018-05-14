class AddFinishedToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :finished, :boolean
  end
end
