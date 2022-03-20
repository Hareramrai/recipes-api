# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, index: {unique: true}
      t.string :password_digest
      t.string :token, index: {unique: true}
      t.timestamp :token_expires_at

      t.timestamps
    end
  end
end
