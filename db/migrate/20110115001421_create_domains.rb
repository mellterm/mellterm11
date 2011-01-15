class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :code
      t.string :long_name
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
