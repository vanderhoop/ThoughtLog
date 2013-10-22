class CreateIdeasTable < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer   :entry_id
      t.text      :idea_text
      t.integer   :emotional_weight, :default => 0
      t.string    :category
      t.timestamps
    end
  end
end
