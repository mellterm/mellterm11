class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :code
      t.string :description
      t.integer :owner_id
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
