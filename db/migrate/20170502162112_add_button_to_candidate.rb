class AddButtonToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :button, :string
  end
end
