class CreateUsers < ActiveRecord::Migration
  def change
    create_table "users", :force => true do |t|
      t.string   "name"
      t.string   "email"
      t.string   "account_name"
      t.string   "password_digest"
      t.string   "remember_token"

      t.timestamps
    end
  end
end
