class AddTitleToPath < ActiveRecord::Migration
  def change
    add_column :paths, :title, :string
  end
end
