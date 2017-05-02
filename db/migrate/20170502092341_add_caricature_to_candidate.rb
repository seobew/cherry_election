class AddCaricatureToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :caricature, :string
  end
end
