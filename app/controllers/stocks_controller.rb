require 'open-uri'

#AlphaVantage API Documentation
#https://www.alphavantage.co/documentation/

class StocksController < ApplicationController
    
    def show_tickerlist
        render("stocks_templates/stock_list.html.erb")
    end
    
    def show_stock_info
        @symbol = params.fetch("ticker")
        
        url="https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=#{ @symbol }&apikey=VJFO0T4UA0YKZUT8"
        @parsed_data = JSON.parse(open(url).read)
        #JSON.parse(open("query.json").read).fetch("Monthly Adjusted Time Series").keys.[0]
        
        @open_price = @parsed_data.dig("Monthly Adjusted Time Series", "2018-05-24", "1. open")
        @close_price = @parsed_data.dig("Monthly Adjusted Time Series", "2018-05-24", "5. adjusted close")
        
        @returns = (@close_price.to_f - @open_price.to_f) / @open_price.to_f
        
        date_count = @parsed_data.fetch("Monthly Adjusted Time Series").length
        
        #Returns an array of all Monthly dates 
        date_keys = @parsed_data.fetch("Monthly Adjusted Time Series").keys
        date_keys_ordered = date_keys.reverse

        @monthly_returns = []
        i = 1
        
        while @monthly_returns.length < date_count-1
            current_month = date_keys_ordered[i]
            last_month = date_keys_ordered[i-1]
            
            current_price = @parsed_data.dig("Monthly Adjusted Time Series", current_month, "5. adjusted close")
            last_month_price = @parsed_data.dig("Monthly Adjusted Time Series", last_month, "5. adjusted close")
            returns = (current_price.to_f - last_month_price.to_f) / last_month_price.to_f
            
            @monthly_returns.push(returns)
            i += 1
        end 
        
        @avg_monthly_return = @monthly_returns.inject(0){|sum,x| sum + x } / @monthly_returns.length
        @avg_annual_return = @avg_monthly_return * 12
        
        render("/stocks_templates/stock_info.html.erb")
    end
    
end