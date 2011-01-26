class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :subscriber_id
      t.integer :subscribee_id

      t.timestamps
    end
    add_index :subscriptions, :subscriber_id
    add_index :subscriptions, :subscribee_id
    add_index :subscriptions, [:subscriber_id, :subscribee_id], :unique => true                                                
  end

  def self.down
    drop_table :subscriptions
  end
end
