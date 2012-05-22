class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|

      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
