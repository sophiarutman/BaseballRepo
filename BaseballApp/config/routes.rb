Rails.application.routes.draw do
  Rails.application.routes.draw do
    root "baseball_app#index"
    #root "error_page"
    #get "error_page" => "error_page"
    get "baseball_app" => "baseball_app#index"
    get "/" => "baseball_app#index"
    post "/" => "baseball_app#enterPlayer"
    post "baseball_app/generate_lineup" => "baseball_app#index"
    delete "baseball_app/delete_player" => "baseball_app#deletePlayer"
  end
end
