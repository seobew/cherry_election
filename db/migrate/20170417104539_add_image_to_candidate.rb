class AddImageToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :image, :string
  end
end
