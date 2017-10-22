require 'test_helper'

describe Admin::PoemsController do
  before do
    sign_in users(:admin)
  end
  it "index" do
    get :index
    assert_equal response.status, 200
  end
end
