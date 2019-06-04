class AddStoryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :story, :string
  end
end
