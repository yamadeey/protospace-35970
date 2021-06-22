require 'test_helper'

class PrototyoesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prototyoes_index_url
    assert_response :success
  end

end
