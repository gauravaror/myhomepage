class ChangeColumn < ActiveRecord::Migration
  def up
    change_column :comments,:comment,:text,:limit => nil
    change_column :posts,:content,:text,:limit => nil
  end

  def down
  end
end
