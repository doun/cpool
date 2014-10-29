class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
