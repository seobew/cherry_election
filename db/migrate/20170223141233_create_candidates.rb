class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      
      t.string :name
      t.string :party
      t.string :link
      t.text :keyword
      t.float :rank

      t.timestamps null: false
    end
  end
end
