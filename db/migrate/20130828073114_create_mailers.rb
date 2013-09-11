class CreateMailers < ActiveRecord::Migration
  def change
    create_table :mailers do |t|
      t.boolean :activate, default: false
      t.string :address, default: "localhost"
      t.integer :port, default: 25
      t.string :domain
      t.string :user_name
      t.string :password
      t.string :auth, default: "plain"
      t.boolean :tls, default: false
      t.string :ssl_mode

      t.timestamps
    end
  end
end
