class ChangeAccessCodeColumnName < ActiveRecord::Migration
  def change
    rename_column :students, :accesscode, :access_code
  end
end
