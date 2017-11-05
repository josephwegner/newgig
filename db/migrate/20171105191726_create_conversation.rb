class CreateConversation < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.timestamps null: false
      t.references :user

      t.string :subject, null: false, default: ''
      t.string :medium

    end

    create_table :emails do |t|
      t.timestamps null: false
      t.references :conversation

      t.string :mongo_id
      t.string :from
    end
  end
end
