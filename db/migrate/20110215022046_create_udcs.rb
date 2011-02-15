class CreateUdcs < ActiveRecord::Migration
  def self.up
    create_table :udcs do |t|
		t.string :code
  		t.string :default_udc_txt		
      	t.timestamps
    end
  end

  def self.down
    drop_table :udcs
  end
end
