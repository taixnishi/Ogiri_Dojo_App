class AddImageToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :image, :string
  end
end
