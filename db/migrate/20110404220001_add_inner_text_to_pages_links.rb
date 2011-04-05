class AddInnerTextToPagesLinks < ActiveRecord::Migration
  def self.up
    add_column :pages_links, :inner_text, :string
  end

  def self.down
    remove_column :pages_links, :inner_text
  end
end
