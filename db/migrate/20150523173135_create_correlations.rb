class CreateCorrelations < ActiveRecord::Migration
  def change
    create_table :correlations do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    add_index :correlations, :follower_id
    add_index :correlations, :followed_id
    add_index :correlations, [:follower_id, :followed_id], unique: true
  end
end
