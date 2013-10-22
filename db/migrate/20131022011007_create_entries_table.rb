class CreateEntriesTable < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :idea_id
      t.timestamps
    end
  end
end
