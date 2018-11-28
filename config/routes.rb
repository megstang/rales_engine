Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find',             to: 'find#show'
        get 'find_all',         to: 'find#index'
        get 'random',           to: 'random#show'
        get ':id/items',        to: 'items#index'
        get ':id/invoices',     to: 'invoices#index'
      end
      resources :merchants,     only: [:index, :show]

      namespace :invoices do
        get ':id/transactions'  to: 'transactions#index'
        get ':id/invoice_items' to: 'invoice_items#index'
        get ':id/items'         to: 'items#index'
        get ':id/customer'      to: 'customers#show'
        get ':id/merchant'      to: 'merchants#show'
      end
      resources :invoices,      only: [:index,:show]
    end
  end
end
