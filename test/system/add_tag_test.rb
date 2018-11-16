require 'application_system_test_case'

OmniAuth.config.test_mode = true

class AddTagTest < ApplicationSystemTestCase
  test 'user can login' do
    response_params = {
      uid: users(:user1).twitter_identifier,
      info: {
        nickname: users(:user1).screen_name
      },
      credentials: {
        token: 'access_token',
        secret: 'access_token_secret'
      }
    }
    OmniAuth.config.add_mock(:twitter, response_params)

    visit root_path

    click_link('twitter login')

    assert_text('logout')

    first('input#tag_title').set('hoge')

    click_button('+')

    assert_text('hoge')
  end
end
