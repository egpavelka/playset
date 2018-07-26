class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at
      t.text :profile_bio
      t.boolean :admin, default: false
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end