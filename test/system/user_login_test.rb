require 'application_system_test_case'

class UserLoginTest < ApplicationSystemTestCase
  test 'user can login' do
    visit root_path

    assert_text('twitter login')
  end
end
