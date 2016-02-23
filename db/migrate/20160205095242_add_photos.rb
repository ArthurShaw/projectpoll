class AddPhotos < ActiveRecord::Migration
  def up
    add_attachment :events, :picture
  end

  def down
    remove_attachment :users, :picture
  end
end
