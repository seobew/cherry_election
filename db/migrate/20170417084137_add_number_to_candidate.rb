class AddNumberToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :number, :integer
  end
end
