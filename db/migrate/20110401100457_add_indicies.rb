class AddIndicies < ActiveRecord::Migration
  def self.up
    add_index :pages_links, :from_page_id
    add_index :pages_links, :to_page_id
    add_index :pages_links, :no_follow
  end

  def self.down
  end
end
