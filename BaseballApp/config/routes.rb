Rails.application.routes.draw do
  Rails.application.routes.draw do
  get 'sort_by_slg' => "sort_by_slg#sortSLG"
  get 'sort_by_ops' => "sort_by_ops#sortOPS"
  get 'sort_by_avg'  => "sort_by_avg#sortAVG"
  get 'sort_by_obp' => "sort_by_obp#sortOBP"
    root "baseball_app#index"
    get 'sort_by_name' => "sort_by_name#sort"
    get "search_app" => 'search_app#index'
    get "search_app/clear_search" => 'search_app#clearSearch'
    get "baseball_app" => "baseball_app#index"
    get "baseball_app/redirect_to_delete_controller" => "baseball_app#redirectToDeleteController"
    get "delete_app" => "delete_app#index"
    get "generate_lineup" => "generate_lineup#index"
    get 'generate_batter_lineup' => 'generate_lineup#generateBatterLineup'
    get "generate_lineup/generate_batter_lineup" => "generate_lineup#generateBatterLineup"
    post "/" => "baseball_app#enterPlayer"
    delete "delete_app"=>"delete_app#index"
  end
end
