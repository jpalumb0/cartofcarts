class AddFollowedCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :followeds_count, :integer
  end
end
