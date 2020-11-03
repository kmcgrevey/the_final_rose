class AddDescriptionToBachelorettes < ActiveRecord::Migration[5.2]
  def change
    add_column :bachelorettes, :season_desc, :string
  end
end
