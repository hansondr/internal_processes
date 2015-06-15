module Oauth
  class User
    def self.find_with_auth_hash(auth_hash)
      UserData::User.find_by(email: auth_hash.info.email)
    end
  end
end