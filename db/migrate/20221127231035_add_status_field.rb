class AddStatusField < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :status, :boolean, default: false
  end
end
