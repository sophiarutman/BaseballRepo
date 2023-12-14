Rails.application.routes.draw do
  Rails.application.routes.draw do
    root "baseball_app#index"
    get "baseball_app" => "baseball_app#index"
    get "/" => "baseball_app#index"
    get "baseball_app/clear_search" => "baseball_app#clearSearch"
    post "baseball_app/sort_by_name" => "baseball_app#sortByName"
    post "baseball_app/sort_by_OBP" => "baseball_app#sortByOBP"
    post "baseball_app/sort_by_AVG" => "baseball_app#sortByAVG"
    post "baseball_app/sort_by_SLG" => "baseball_app#sortBySLG"
    post "baseball_app/sort_by_OPS" => "baseball_app#sortByOPS"
    post "/" => "baseball_app#enterPlayer"
    post "baseball_app/generate_lineup" => "baseball_app#index"
    delete "baseball_app/delete_player" => "baseball_app#deletePlayer"
  end
end
