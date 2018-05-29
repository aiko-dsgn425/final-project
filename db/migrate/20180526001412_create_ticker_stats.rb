class CreateTickerStats < ActiveRecord::Migration[5.1]
  def change
    create_table :ticker_stats do |t|
      t.float :sharpe_ratio
      t.float :annual_returns
      t.integer :ticker_id
      t.float :annualized_risk
      t.float :expense_ratio
      t.boolean :current

      t.timestamps
    end
  end
end
