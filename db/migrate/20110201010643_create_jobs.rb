class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.integer :company_id
      t.float :invoiced_amount
      t.integer :currency_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
