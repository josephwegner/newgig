class EmailBodyInPostgresJson < ActiveRecord::Migration[5.1]
  def change
    remove_column :emails, :mongo_id, :string

    create_table :email_raws do |t|
      t.references :email

      t.string :body
    end
  end
end
