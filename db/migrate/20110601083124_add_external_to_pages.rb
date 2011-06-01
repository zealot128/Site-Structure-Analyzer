class AddExternalToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :external, :boolean
  end

  def self.down
    remove_column :pages, :external
  end
end
