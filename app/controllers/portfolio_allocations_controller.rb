class PortfolioAllocationsController < ApplicationController
  def index
    @portfolio_allocations = PortfolioAllocation.all

    render("portfolio_allocation_templates/index.html.erb")
  end

  def show
    @portfolio_allocation = PortfolioAllocation.find(params.fetch("id_to_display"))

    render("portfolio_allocation_templates/show.html.erb")
  end

  def new_form
    render("portfolio_allocation_templates/new_form.html.erb")
  end

  def create_row
    @portfolio_allocation = PortfolioAllocation.new

    @portfolio_allocation.portfolio_id = params.fetch("portfolio_id")
    @portfolio_allocation.ticker_id = params.fetch("ticker_id")
    @portfolio_allocation.percent_allocated = params.fetch("percent_allocated")

    if @portfolio_allocation.valid?
      @portfolio_allocation.save

      redirect_to("/portfolio_allocations", :notice => "Portfolio allocation created successfully.")
    else
      render("portfolio_allocation_templates/new_form.html.erb")
    end
  end

  def edit_form
    @portfolio_allocation = PortfolioAllocation.find(params.fetch("prefill_with_id"))

    render("portfolio_allocation_templates/edit_form.html.erb")
  end

  def update_row
    @portfolio_allocation = PortfolioAllocation.find(params.fetch("id_to_modify"))

    @portfolio_allocation.portfolio_id = params.fetch("portfolio_id")
    @portfolio_allocation.ticker_id = params.fetch("ticker_id")
    @portfolio_allocation.percent_allocated = params.fetch("percent_allocated")

    if @portfolio_allocation.valid?
      @portfolio_allocation.save

      redirect_to("/portfolio_allocations/#{@portfolio_allocation.id}", :notice => "Portfolio allocation updated successfully.")
    else
      render("portfolio_allocation_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @portfolio_allocation = PortfolioAllocation.find(params.fetch("id_to_remove"))

    @portfolio_allocation.destroy

    redirect_to("/portfolio_allocations", :notice => "Portfolio allocation deleted successfully.")
  end
end
