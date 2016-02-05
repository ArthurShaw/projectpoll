class CreateEvents < ActiveRecord::Migration
  def change

    create_table :events do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.datetime :date
      t.text :description
      t.string :photo
      t.integer :type, default: 0

      t.timestamps null: false
    end
  end
end
