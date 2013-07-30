class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :oauth_token
      t.string :oauth_secret
      t.string :profile_image_url

      t.timestamps
    end
  end
end
