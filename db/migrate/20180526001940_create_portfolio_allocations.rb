class CreatePortfolioAllocations < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_allocations do |t|
      t.integer :portfolio_id
      t.integer :ticker_id
      t.float :percent_allocated

      t.timestamps
    end
  end
end
