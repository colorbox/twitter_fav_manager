require 'active_support/core_ext/object/with_options'

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      debugger
      with_options null: false do
        t.string :twitter_identifier
        t.string :screen_name
        t.string :name
        t.string :access_token
        t.string :access_token_secret

      end
      # t.string :twitter_identifier, null: false
      # t.string :screen_name, null: false
      # t.string :name, null: false
      # t.string :access_token, null: false
      # t.string :access_token_secret, null: false

      t.timestamps
    end
  end
end
