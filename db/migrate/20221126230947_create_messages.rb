class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :msgbody
      t.integer :conversation_id
      t.integer :user_id

      t.timestamps
    end
  end
end