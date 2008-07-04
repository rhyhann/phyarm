class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :default => "New"
      t.text :content, :default => "New"
      t.integer :category_id
      t.timestamps
    end
    Category.create
  end

  def self.down
    drop_table :categories
  end
end
