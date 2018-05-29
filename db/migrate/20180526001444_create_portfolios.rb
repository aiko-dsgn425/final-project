class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :description
      t.float :initial_value
      t.float :returns_sinceinception
      t.float :expected_returns
      t.float :expected_volatility
      t.integer :user_id

      t.timestamps
    end
  end
end
