class AddAttrToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :last_name
      t.date :birth_date

    end

  end
end
