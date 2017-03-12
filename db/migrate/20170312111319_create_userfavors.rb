class CreateUserfavors < ActiveRecord::Migration
  def change
    create_table :userfavors do |t|
      t.boolean :check_like
      t.boolean :check_dislike

      t.timestamps null: false
    end
  end
end
