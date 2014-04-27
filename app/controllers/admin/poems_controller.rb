class Admin::PoemsController < Admin::ApplicationController
  respond_to :html, :json

  before_action :authenticate_user!
  before_action :user_must_be_admin

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

  private
  def poem_params
    params.require(:poem).permit(:title, :text, :johnson, :franklin)
  end

  def user_must_be_admin
    if current_user && !current_user.admin?
      redirect_to :root, notice: "You must be an admin"
    end
  end
end
