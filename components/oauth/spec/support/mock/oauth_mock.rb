OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google] = {
    "provider":"google",
    "uid":"999999999999999999999",
    "info":{
        "name":"John Doe",
        "email":"john.doe@americanfinancing.net",
        "first_name":"John",
        "last_name":"Doe",
        "image":"https://www.example.com/photo.jpg?sz=50",
        "urls":{
            "Google":"https://plus.google.com/999999999999999999999"
        }
    },
    "credentials":{
        "token":"token1234sample",
        "expires_at":1434042163,
        "expires":true
    },
    "extra":{
        "id_token":"idTokenSuperLong~950characters",
        "raw_info":{
            "kind":"plus#personOpenIdConnect",
            "gender":"male",
            "sub":"999999999999999999999",
            "name":"John Doe",
            "given_name":"John",
            "family_name":"Doe",
            "profile":"https://plus.google.com/999999999999999999999",
            "picture":"https://www.example.com/photo.jpg?sz=50",
            "email":"john.doe@americanfinancing.net",
            "email_verified":"true",
            "hd":"americanfinancing.net"
        }
    }
}