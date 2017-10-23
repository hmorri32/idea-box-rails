class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string  :title
      t.text    :body
      t.integer :quality

      t.timestamps
    end
  end
end
