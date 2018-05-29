class CreateTickers < ActiveRecord::Migration[5.1]
  def change
    create_table :tickers do |t|
      t.string :symbol
      t.string :category
      t.string :security_type
      t.string :url

      t.timestamps
    end
  end
end
