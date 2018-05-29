Rails.application.routes.draw do

  get("/", { :controller => "dashboard", :action => "show_home" })
  get("/dashboard", { :controller => "dashboard", :action => "show_home" })
  
  
  # Stocks
  get("/stock_info", { :controller => "tickers", :action => "show_stock_info" })
  
  # Tangent Portfolio
  get("/calculate_optimalportfolio", { :controller => "portfolio", :action => "calculate_tangencyportfolio"})
  
  #------------------------------
  
  # Routes for the Tag resource:

  # CREATE
  get("/tags/new", { :controller => "tags", :action => "new_form" })
  post("/create_tag", { :controller => "tags", :action => "create_row" })

  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  get("/tags/:id_to_display", { :controller => "tags", :action => "show" })

  # UPDATE
  get("/tags/:prefill_with_id/edit", { :controller => "tags", :action => "edit_form" })
  post("/update_tag/:id_to_modify", { :controller => "tags", :action => "update_row" })

  # DELETE
  get("/delete_tag/:id_to_remove", { :controller => "tags", :action => "destroy_row" })

  #------------------------------

  # Routes for the User tickerlist resource:

  # CREATE
  get("/user_tickerlists/new", { :controller => "user_tickerlists", :action => "new_form" })
  post("/create_user_tickerlist", { :controller => "user_tickerlists", :action => "create_row" })

  # READ
  get("/user_tickerlists", { :controller => "user_tickerlists", :action => "index" })
  get("/user_tickerlists/:id_to_display", { :controller => "user_tickerlists", :action => "show" })

  # UPDATE
  get("/user_tickerlists/:prefill_with_id/edit", { :controller => "user_tickerlists", :action => "edit_form" })
  post("/update_user_tickerlist/:id_to_modify", { :controller => "user_tickerlists", :action => "update_row" })

  # DELETE
  get("/delete_user_tickerlist/:id_to_remove", { :controller => "user_tickerlists", :action => "destroy_row" })

  #------------------------------

  # Routes for the Portfolio allocation resource:

  # CREATE
  get("/portfolio_allocations/new", { :controller => "portfolio_allocations", :action => "new_form" })
  post("/create_portfolio_allocation", { :controller => "portfolio_allocations", :action => "create_row" })

  # READ
  get("/portfolio_allocations", { :controller => "portfolio_allocations", :action => "index" })
  get("/portfolio_allocations/:id_to_display", { :controller => "portfolio_allocations", :action => "show" })

  # UPDATE
  get("/portfolio_allocations/:prefill_with_id/edit", { :controller => "portfolio_allocations", :action => "edit_form" })
  post("/update_portfolio_allocation/:id_to_modify", { :controller => "portfolio_allocations", :action => "update_row" })

  # DELETE
  get("/delete_portfolio_allocation/:id_to_remove", { :controller => "portfolio_allocations", :action => "destroy_row" })

  #------------------------------

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Routes for the Portfolio resource:

  # CREATE
  get("/portfolios/new", { :controller => "portfolios", :action => "new_form" })
  post("/create_portfolio", { :controller => "portfolios", :action => "create_row" })

  # READ
  get("/portfolios", { :controller => "portfolios", :action => "index" })
  get("/portfolios/:id_to_display", { :controller => "portfolios", :action => "show" })

  # UPDATE
  get("/portfolios/:prefill_with_id/edit", { :controller => "portfolios", :action => "edit_form" })
  post("/update_portfolio/:id_to_modify", { :controller => "portfolios", :action => "update_row" })

  # DELETE
  get("/delete_portfolio/:id_to_remove", { :controller => "portfolios", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ticker stat resource:

  # CREATE
  get("/ticker_stats/new", { :controller => "ticker_stats", :action => "new_form" })
  post("/create_ticker_stat", { :controller => "ticker_stats", :action => "create_row" })

  # READ
  get("/ticker_stats", { :controller => "ticker_stats", :action => "index" })
  get("/ticker_stats/:id_to_display", { :controller => "ticker_stats", :action => "show" })

  # UPDATE
  get("/ticker_stats/:prefill_with_id/edit", { :controller => "ticker_stats", :action => "edit_form" })
  post("/update_ticker_stat/:id_to_modify", { :controller => "ticker_stats", :action => "update_row" })

  # DELETE
  get("/delete_ticker_stat/:id_to_remove", { :controller => "ticker_stats", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ticker resource:

  # CREATE
  get("/tickers/new", { :controller => "tickers", :action => "new_form" })
  post("/create_ticker", { :controller => "tickers", :action => "create_row" })

  # READ
  get("/tickers", { :controller => "stocks", :action => "show_tickerlist" })
  get("/tickers/:id_to_display", { :controller => "tickers", :action => "show" })

  # UPDATE
  get("/tickers/:prefill_with_id/edit", { :controller => "tickers", :action => "edit_form" })
  post("/update_ticker/:id_to_modify", { :controller => "tickers", :action => "update_row" })

  # DELETE
  get("/delete_ticker/:id_to_remove", { :controller => "tickers", :action => "destroy_row" })

  #------------------------------
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end