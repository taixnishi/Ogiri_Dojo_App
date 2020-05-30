class AddThemeIdToFavorite < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :theme_id, :string
  end
end
