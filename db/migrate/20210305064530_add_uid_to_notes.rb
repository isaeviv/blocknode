class AddUidToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :uid, :integer
  end
end
