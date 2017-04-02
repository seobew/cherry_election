class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      
      t.string :title
      t.string :publisher
      t.integer :like
      t.integer :unlike
      t.string :link
      t.timestamp :article_date

      t.timestamps null: false
    end
  end
end
