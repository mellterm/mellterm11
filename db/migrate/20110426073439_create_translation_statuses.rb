class CreateTranslationStatuses < ActiveRecord::Migration
  def self.up
    create_table :translation_statuses do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :translation_statuses
  end
end
