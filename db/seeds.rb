User.create(
  twitter_identifier: ENV['TEST_OWNER_TWITTER_IDENTIFIER'],
  screen_name: ENV['TEST_OWNER_SCREEN_NAME'],
  name: ENV['TEST_OWNER_USER_NAME'],
  access_token: ENV['TEST_OWNER_ACCESS_TOKEN'],
  access_token_secret: ENV['TEST_OWNER_ACCESS_TOKEN_SECRET'],
)
