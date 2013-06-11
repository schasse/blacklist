Rails.application.routes.draw do

  mount Blacklist::Engine => "/blacklist"
end
