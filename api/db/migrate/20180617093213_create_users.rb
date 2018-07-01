class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :password_digest
      t.boolean :activated
      t.datetime :activated_at
      t.string :activation_digest
      t.text :bio
      t.boolean :admin
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
