class TickerStatsController < ApplicationController
  def index
    @ticker_stats = TickerStat.all

    render("ticker_stat_templates/index.html.erb")
  end

  def show
    @ticker_stat = TickerStat.find(params.fetch("id_to_display"))

    render("ticker_stat_templates/show.html.erb")
  end

  def new_form
    render("ticker_stat_templates/new_form.html.erb")
  end

  def create_row
    @ticker_stat = TickerStat.new

    @ticker_stat.sharpe_ratio = params.fetch("sharpe_ratio")
    @ticker_stat.annual_returns = params.fetch("annual_returns")
    @ticker_stat.ticker_id = params.fetch("ticker_id")
    @ticker_stat.annualized_risk = params.fetch("annualized_risk")
    #@ticker_stat.expense_ratio = params.fetch("expense_ratio")
    @ticker_stat.user_id = params.fetch("user_id")

    if @ticker_stat.valid?
      @ticker_stat.save

      redirect_to("/tickers/#{ @ticker_stat.ticker_id }", :notice => "Ticker stat created successfully.")
    else
      render("ticker_stat_templates/new_form.html.erb")
    end
  end

  def edit_form
    @ticker_stat = TickerStat.find(params.fetch("prefill_with_id"))

    render("ticker_stat_templates/edit_form.html.erb")
  end

  def update_row
    @ticker_stat = TickerStat.find(params.fetch("id_to_modify"))

    @ticker_stat.sharpe_ratio = params.fetch("sharpe_ratio")
    @ticker_stat.annual_returns = params.fetch("annual_returns")
    @ticker_stat.ticker_id = params.fetch("ticker_id")
    @ticker_stat.annualized_risk = params.fetch("annualized_risk")
    @ticker_stat.user_id = params.fetch("user_id")
    @ticker_stat.expense_ratio = params.fetch("expense_ratio")
    @ticker_stat.current = params.fetch("current")

    if @ticker_stat.valid?
      @ticker_stat.save

      redirect_to("/ticker_stats/#{@ticker_stat.id}", :notice => "Ticker stat updated successfully.")
    else
      render("ticker_stat_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @ticker_stat = TickerStat.find(params.fetch("id_to_remove"))

    @ticker_stat.destroy

    redirect_to("/ticker_stats", :notice => "Ticker stat deleted successfully.")
  end
end
