Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'leads#index'

  resources :leads

  namespace 'api' do
    namespace 'v1' do
      resources :leads, only: %i[index], param: :token
    end
  end
end
