class CreateJoinTableContentCourse < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contents, :courses do |t|
      t.index [:content_id, :course_id]
      t.index [:course_id, :content_id]
    end
  end
end
