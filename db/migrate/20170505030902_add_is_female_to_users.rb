class AddIsFemaleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_female, :boolean
  end
end
