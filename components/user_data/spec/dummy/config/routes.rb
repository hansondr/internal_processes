Rails.application.routes.draw do

  mount UserData::Engine => "/user_data"
end
