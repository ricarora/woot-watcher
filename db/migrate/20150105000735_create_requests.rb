class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :website
      t.string :stringmatch
      t.boolean :email
      t.datetime :when

      t.timestamps
    end
  end
end
