class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :nom
      t.float :latitute
      t.float :longitude

      t.timestamps
    end
  end
end
