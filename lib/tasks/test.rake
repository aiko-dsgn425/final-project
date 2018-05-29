desc "Calculate mean"
task :test do
  path_to_file = Rails.root + "lib/input_files/query.json"
  
  parsed_data = JSON.parse(open(path_to_file).read)
  
  data_length = @parsed_data.fetch("Monthly Adjusted Time Series").length
        
        #Returns an array of all Monthly dates 
        date_keys = parsed_data.fetch("Monthly Adjusted Time Series").keys
        
        monthly_returns = []
        
        date_keys.each do |date|
            open_price = parsed_data.dig("Monthly Adjusted Time Series", date, "1. open")
            close_price = parsed_data.dig("Monthly Adjusted Time Series", date, "5. adjusted close")
            returns = (close_price.to_f - open_price.to_f) / open_price.to_f
            monthly_returns.push(returns)
            ap(open_price.to_s + close_price.to_s + returns.to_s)
        end
        
        ap("monthly return array: " + monthly_returns)
        
        avg_monthly_return = monthly_returns.inject(0){|sum,x| sum + x } / data_length
        
        ap(avg_monthly_return)

end
