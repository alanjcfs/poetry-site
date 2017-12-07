class Admin::PoemsController < Admin::ApplicationController
  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.new(poem_params)

    if @poem.save
      redirect_to admin_poem_path(@poem)
    else
      render 'new'
    end
  end

  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find params[:id]
  end

  def edit
    @poem = Poem.find params[:id]
  end

  def update
    @poem = Poem.find params[:id]
    @poem.update_attributes(poem_params)

    redirect_to admin_poem_url(@poem)
  end

  protected
  def poem_params
    params.require(:poem).permit(:title, :text, :plain_text, :johnson, :franklin)
  end
end
