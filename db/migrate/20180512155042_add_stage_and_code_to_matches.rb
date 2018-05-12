class AddStageAndCodeToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :code, :integer
    add_column :matches, :stage, :string
  end
end
