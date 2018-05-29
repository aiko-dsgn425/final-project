class TagsController < ApplicationController
  def index
    @tags = Tag.all

    render("tag_templates/index.html.erb")
  end

  def show
    @tag = Tag.find(params.fetch("id_to_display"))

    render("tag_templates/show.html.erb")
  end

  def new_form
    render("tag_templates/new_form.html.erb")
  end

  def create_row
    @tag = Tag.new

    @tag.name = params.fetch("name")
    @tag.description = params.fetch("description")

    if @tag.valid?
      @tag.save

      redirect_to("/tags", :notice => "Tag created successfully.")
    else
      render("tag_templates/new_form.html.erb")
    end
  end

  def edit_form
    @tag = Tag.find(params.fetch("prefill_with_id"))

    render("tag_templates/edit_form.html.erb")
  end

  def update_row
    @tag = Tag.find(params.fetch("id_to_modify"))

    @tag.name = params.fetch("name")
    @tag.description = params.fetch("description")

    if @tag.valid?
      @tag.save

      redirect_to("/tags/#{@tag.id}", :notice => "Tag updated successfully.")
    else
      render("tag_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @tag = Tag.find(params.fetch("id_to_remove"))

    @tag.destroy

    redirect_to("/tags", :notice => "Tag deleted successfully.")
  end
end
