Rails.application.routes.draw do
  Rails.application.routes.draw do
    root "baseball_app#index"
    get "baseball_app" => "baseball_app#index"
    get "/" => "baseball_app#index"
    post "/" => "baseball_app#enterPlayer"
  end
end
