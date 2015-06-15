def sign_in_as(user)
  mock_google_oauth_for_user(user)
end

def sign_in
  sign_in_as create(:user)
end

def mock_google_oauth_for_user(user)
  fullname = "#{user.first_name} #{user.last_name}"
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    "provider": "google",
    "uid": "999999999999999999999",
    "info":{
      "name": fullname,
      "email": user.email,
      "first_name": user.first_name,
      "last_name": user.last_name,
      "image": "https://www.example.com/photo.jpg?sz=50",
      "urls": {
          "Google":"https://plus.google.com/999999999999999999999"
      }
    },
    "credentials": {
      "token":"token1234sample",
      "expires_at":1434042163,
      "expires":true
    },
    "extra":{
      "id_token":"idTokenSuperLong~950characters",
      "raw_info": {
        "kind": "plus#personOpenIdConnect",
        "gender": "male",
        "sub":"999999999999999999999",
        "name": fullname,
        "given_name": user.first_name,
        "family_name": user.last_name,
        "profile": "https://plus.google.com/999999999999999999999",
        "picture": "https://www.example.com/photo.jpg?sz=50",
        "email": user.email,
        "email_verified": "true",
        "hd": "americanfinancing.net"
      }
    }
  })
end