require 'test_helper'

describe Admin::PoemsController do
  before do
    sign_in users(:admin)
  end
  it "index" do
    get :index
    assert assigns(:poems), "poems should be assigned"
  end
end
