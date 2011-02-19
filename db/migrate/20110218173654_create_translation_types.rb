class CreateTranslationTypes < ActiveRecord::Migration
  def self.up
    create_table :translation_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :translation_types
  end
end
