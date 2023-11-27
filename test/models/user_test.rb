require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without username' do
    user = User.new(email: 'test@example.com', password: 'password')
    assert_not user.save, 'Saved user without a username'
  end

  test 'should not save user without email' do
    user = User.new(username: 'testuser', password: 'password')
    assert_not user.save, 'Saved user without an email'
  end

  test 'should not save user without password' do
    user = User.new(username: 'testuser', email: 'test@example.com')
    assert_not user.save, 'Saved user without a password'
  end

  test 'should save valid user' do
    user = User.new(username: 'testuser', email: 'test@example.com', password: 'password')
    assert user.save, 'Failed to save a valid user'
  end
end
