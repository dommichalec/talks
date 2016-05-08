require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should successfully get the homepage' do
    get :home
    assert :success
  end
end
