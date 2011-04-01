class AddLinksCountToPage < ActiveRecord::Migration

  def self.up
    add_column :pages, :links_count, :integer
    add_column :pages, :backlinks_count, :integer
  end

  def self.down
  end
end
