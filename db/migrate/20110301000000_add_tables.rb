class AddTables < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :url
      t.string :title
      t.integer :size
      t.string :status_code
      t.text :aliase
    end
    create_table :pages_links do |t|
      t.integer :from_page_id
      t.integer :to_page_id
      t.boolean :no_follow
      t.string :title
    end
  end

  def self.down
    drop_table :pages
    drop_table :pages_links
  end
end
