class CreateUserTickerlists < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tickerlists do |t|
      t.integer :user_id
      t.integer :ticker_id
      t.integer :tag_id
      t.boolean :watchlist

      t.timestamps
    end
  end
end
