class UserTickerlistsController < ApplicationController
  def index
    @user_tickerlists = UserTickerlist.all

    render("user_tickerlist_templates/index.html.erb")
  end

  def show
    @user_tickerlist = UserTickerlist.find(params.fetch("id_to_display"))

    render("user_tickerlist_templates/show.html.erb")
  end

  def new_form
    render("user_tickerlist_templates/new_form.html.erb")
  end

  def create_row
    @user_tickerlist = UserTickerlist.new

    @user_tickerlist.user_id = params.fetch("user_id")
    @user_tickerlist.ticker_id = params.fetch("ticker_id")
    @user_tickerlist.tag_id = params.fetch("tag_id")
    @user_tickerlist.watchlist = params.fetch("watchlist")

    if @user_tickerlist.valid?
      @user_tickerlist.save

      redirect_to("/user_tickerlists", :notice => "User tickerlist created successfully.")
    else
      render("user_tickerlist_templates/new_form.html.erb")
    end
  end

  def edit_form
    @user_tickerlist = UserTickerlist.find(params.fetch("prefill_with_id"))

    render("user_tickerlist_templates/edit_form.html.erb")
  end

  def update_row
    @user_tickerlist = UserTickerlist.find(params.fetch("id_to_modify"))

    @user_tickerlist.user_id = params.fetch("user_id")
    @user_tickerlist.ticker_id = params.fetch("ticker_id")
    @user_tickerlist.tag_id = params.fetch("tag_id")
    @user_tickerlist.watchlist = params.fetch("watchlist")

    if @user_tickerlist.valid?
      @user_tickerlist.save

      redirect_to("/user_tickerlists/#{@user_tickerlist.id}", :notice => "User tickerlist updated successfully.")
    else
      render("user_tickerlist_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @user_tickerlist = UserTickerlist.find(params.fetch("id_to_remove"))

    @user_tickerlist.destroy

    redirect_to("/user_tickerlists", :notice => "User tickerlist deleted successfully.")
  end
end
