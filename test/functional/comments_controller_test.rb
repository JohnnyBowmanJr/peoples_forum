require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
 	

	test "does index work"
		get :index
		assert_response :success
	end

	#test that right instance variable is getting passed between controllers and views

	#test that pages works

end
