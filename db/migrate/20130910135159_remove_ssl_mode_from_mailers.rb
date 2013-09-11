class RemoveSslModeFromMailers < ActiveRecord::Migration
  def change
    remove_column :mailers, :ssl_mode, :string
  end
end
