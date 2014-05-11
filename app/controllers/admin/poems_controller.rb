class Admin::PoemsController < Admin::ApplicationController
  respond_to :html, :json

  def index
    @poems = Poem.all

    respond_with @poems
  end

  def show
    @poem = Poem.find params[:id]

    respond_with @poem
  end

  def edit
    @poem = Poem.find params[:id]

    respond_with @poem
  end

  def update
    @poem = Poem.find params[:id]
    @poem.update_attributes(poem_params)

    respond_with @poem, location: admin_poem_url(@poem)
  end
end
