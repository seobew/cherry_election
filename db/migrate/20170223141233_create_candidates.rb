class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      
      t.string :name
      t.string :party
      t.string :link
      t.text :keyword
      t.float :rank
      t.float :rank1ago
      t.float :rank2ago
      t.float :rank3ago

      t.timestamps null: false
    end
  end
end
