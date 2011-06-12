class AddW3errorsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :w3errors, :integer
  end

  def self.down
    remove_column :pages, :w3errors
  end
end
