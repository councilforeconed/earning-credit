class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :accesscode
      t.string :teacher_email
      t.string :section_code
      t.string :student_id

      t.timestamps
    end
  end
end
