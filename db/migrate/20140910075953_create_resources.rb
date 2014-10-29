class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :path, index: true
      t.datetime :start_time
      t.datetime :open_time
      t.datetime :close_time
      t.references :created_by, index: true
      t.references :driver, index: true

      t.timestamps
    end
  end
end
