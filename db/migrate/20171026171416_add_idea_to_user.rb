class AddIdeaToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :ideas, :user, index: true, foreign_key: true
  end
end
