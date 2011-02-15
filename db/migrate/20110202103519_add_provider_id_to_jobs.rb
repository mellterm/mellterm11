class AddProviderIdToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :provider_id, :integer
  end

  def self.down
    remove_column :jobs, :provider_id
  end
end
