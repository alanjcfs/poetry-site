require 'test_helper'

class PoemTest < ActiveSupport::TestCase
  test "following attributes should exist" do
    poem = Poem.new
    poem.must_respond_to :johnson
  end
end
