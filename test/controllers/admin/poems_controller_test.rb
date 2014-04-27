require 'test_helper'

describe Admin::PoemsController do
  it "index" do
    get :index
    assert_not_nil assigns(:poems)
  end
end
