class AddCourseNameToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :course_name, :string
  end
end
