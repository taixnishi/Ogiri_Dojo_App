class AddUserIdToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :user_id, :integer
  end
end
