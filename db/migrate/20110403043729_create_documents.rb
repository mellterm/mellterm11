class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.string :document_type
      t.integer :user_id
	  t.integer :provider_id	
      t.timestamps
    end
    	add_index :documents, :provider_id
  end

  def self.down
    drop_table :documents
  end
end