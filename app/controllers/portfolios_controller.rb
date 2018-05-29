class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all

    render("portfolio_templates/index.html.erb")
  end

  def show
    @portfolio = Portfolio.find(params.fetch("id_to_display"))

    render("portfolio_templates/show.html.erb")
  end

  def new_form
    render("portfolio_templates/new_form.html.erb")
  end

  def create_row
    @portfolio = Portfolio.new

    @portfolio.name = params.fetch("name")
    @portfolio.description = params.fetch("description")
    @portfolio.initial_value = params.fetch("initial_value")
    @portfolio.returns_sinceinception = params.fetch("returns_sinceinception")
    @portfolio.expected_returns = params.fetch("expected_returns")
    @portfolio.expected_volatility = params.fetch("expected_volatility")
    @portfolio.user_id = params.fetch("user_id")

    if @portfolio.valid?
      @portfolio.save

      redirect_to("/portfolios", :notice => "Portfolio created successfully.")
    else
      render("portfolio_templates/new_form.html.erb")
    end
  end

  def edit_form
    @portfolio = Portfolio.find(params.fetch("prefill_with_id"))

    render("portfolio_templates/edit_form.html.erb")
  end

  def update_row
    @portfolio = Portfolio.find(params.fetch("id_to_modify"))

    @portfolio.name = params.fetch("name")
    @portfolio.description = params.fetch("description")
    @portfolio.initial_value = params.fetch("initial_value")
    @portfolio.returns_sinceinception = params.fetch("returns_sinceinception")
    @portfolio.expected_returns = params.fetch("expected_returns")
    @portfolio.expected_volatility = params.fetch("expected_volatility")
    @portfolio.user_id = params.fetch("user_id")

    if @portfolio.valid?
      @portfolio.save

      redirect_to("/portfolios/#{@portfolio.id}", :notice => "Portfolio updated successfully.")
    else
      render("portfolio_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @portfolio = Portfolio.find(params.fetch("id_to_remove"))

    @portfolio.destroy

    redirect_to("/portfolios", :notice => "Portfolio deleted successfully.")
  end
end
