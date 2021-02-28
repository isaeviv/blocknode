class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #dobavil index dlja emailov juserov
    add_index :users, :email, unique: true
  end
end
