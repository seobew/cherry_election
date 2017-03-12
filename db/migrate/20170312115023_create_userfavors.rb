class CreateUserfavors < ActiveRecord::Migration
  def change
    create_table :userfavors do |t|
      t.integer :article_id
      t.integer :user_id
      t.boolean :check_like
      t.boolean :check_unlike

      t.timestamps null: false
    end
  end
end
