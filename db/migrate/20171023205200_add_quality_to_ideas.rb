class AddQualityToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :quality, :integer
  end
end
