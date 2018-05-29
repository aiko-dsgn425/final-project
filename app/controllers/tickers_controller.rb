require 'open-uri'

class TickersController < ApplicationController
  def index
    @tickers = Ticker.all

    render("ticker_templates/index.html.erb")
  end

  def show
    @ticker = Ticker.find(params.fetch("id_to_display"))

    render("ticker_templates/show.html.erb")
  end

  def new_form
    render("ticker_templates/new_form.html.erb")
  end

  def create_row
    @ticker = Ticker.new

    @ticker.symbol = params.fetch("symbol")
    @ticker.category = params.fetch("category")
    @ticker.security_type = params.fetch("security_type")
    @ticker.url = params.fetch("url")

    if @ticker.valid?
      @ticker.save

      redirect_to("/tickers", :notice => "Ticker created successfully.")
    else
      render("ticker_templates/new_form.html.erb")
    end
  end

  def edit_form
    @ticker = Ticker.find(params.fetch("prefill_with_id"))

    render("ticker_templates/edit_form.html.erb")
  end

  def update_row
    @ticker = Ticker.find(params.fetch("id_to_modify"))

    @ticker.symbol = params.fetch("symbol")
    @ticker.category = params.fetch("category")
    @ticker.security_type = params.fetch("security_type")
    @ticker.url = params.fetch("url")

    if @ticker.valid?
      @ticker.save

      redirect_to("/tickers/#{@ticker.id}", :notice => "Ticker updated successfully.")
    else
      render("ticker_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @ticker = Ticker.find(params.fetch("id_to_remove"))

    @ticker.destroy

    redirect_to("/tickers", :notice => "Ticker deleted successfully.")
  end
  
  def show_tickerlist
    render("stocks_templates/stock_list.html.erb")
  end
    
  def show_stock_info
      @symbol = params.fetch("ticker")
      
      url="https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=#{ @symbol }&apikey=VJFO0T4UA0YKZUT8"
      @parsed_data = JSON.parse(open("query.json").read)
      #@parsed_data = JSON.parse(open(url).read)
      
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
      
    # Calculate average standard deviation
      diffsquare_array = []
  
      @monthly_returns.each do |month_return|
        diffsquare = (@avg_monthly_return - month_return)**2
        diffsquare_array.push(diffsquare)
      end
      
      diffsquare_sum = diffsquare_array.sum
      variance = diffsquare_sum / @monthly_returns.count
      stdev = variance**(0.5)
      
      @annualized_stdev = stdev * (12**0.5)
      @riskfree_rate = 0.01
      
      @sharpe_ratio = (@avg_annual_return - @riskfree_rate) / @annualized_stdev
      
      render("/stocks_templates/stock_info.html.erb")
  end
    
end
