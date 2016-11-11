class RemoveNameFromLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :name, :string
  end
end
