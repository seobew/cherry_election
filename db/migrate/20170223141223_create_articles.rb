class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      
      t.string :title
      t.integer :like
      t.integer :unlike
      t.string :link

      t.timestamps null: false
    end
  end
end
