module UserAdminUi
  class ApplicationController < Oauth::ApplicationController
    layout 'admin_assets/application'
    before_action :authorized?

    private

    def authorized?
      if current_user
        #raise Pundit::NotAuthorizedError unless AccessPolicy.new(current_user, :admin).access?
        #raise "hello #{current_user.first_name}, you are authorized to view this page"
      else
        require_login
      end
    end
  end
end
