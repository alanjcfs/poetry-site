class Admin::PoemsController < Admin::ApplicationController
  def index
    @poems = Poem.all
  end
end
