class AddEventidToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :event, index: true, foreign_key: true
  end
end
