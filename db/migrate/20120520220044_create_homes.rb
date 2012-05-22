class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :article

      t.timestamps
    end
  end
end
