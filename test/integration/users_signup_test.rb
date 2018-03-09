require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
test "invalid signup information" do
  get signup path
  assert_no_difference 'User.count' do
    post users_path, params: { user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"}}
  end
  follow_redirect!
  assert_template 'users/show'
  assert_not flash.empty?

  #assert_select 'div#<CSS id for error explanation>'
  #assert_select 'div.<CSS class for field with error>'
end
end
