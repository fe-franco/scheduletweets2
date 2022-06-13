class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false,  length: { minimum: 6 }, on: :create

      t.timestamps
    end
  end
end
