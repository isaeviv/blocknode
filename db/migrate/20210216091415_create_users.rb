class CreateUsers < ActiveRecord::Migration

  #metod change opredeljaet izmenenija, kotorye neobhodimo vnesti v bd
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      #etot metod sozdaet dve metki vremeni v vide stolbcov
      #metki fiksirujut vremja sozdanija i obnovlenija usera(v dannom sluchae)
      t.timestamps null: false
    end
  end
end
