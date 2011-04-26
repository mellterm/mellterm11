class CreateConceptDomains < ActiveRecord::Migration
  def self.up
    create_table :concept_domains do |t|
      t.integer :concept_id
      t.integer :domain_id

      t.timestamps
    end
  end

  def self.down
    drop_table :concept_domains
  end
end
