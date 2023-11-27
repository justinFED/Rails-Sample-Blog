require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { username: 'testuser', email: 'test@example.com', password: 'password' } }
    end

    assert_redirected_to root_url
    assert_equal 'User was successfully created.', flash[:notice]
  end

  test 'should not create invalid user' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { username: '', email: 'test@example.com', password: 'password' } }
    end

    assert_template :new
    assert_not_nil assigns(:user)
    assert assigns(:user).errors.any?
  end
end
