Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show] do
        get '/invoices',     to: 'customers#invoices'
        get '/transactions', to: 'customers#transactions'
      end
      get 'customers/random'   => 'customers#random'
      get 'customers/find'     => 'customers#find'
      get 'customers/find_all' => 'customers#find_all'
      resources :invoice_items, only: [:index, :show] do
        get '/invoice', to: 'invoice_items#invoice'
        get '/item',    to: 'invoice_items#item'
      end
      get 'invoice_items/random'   => 'invoice_items#random'
      get 'invoice_items/find'     => 'invoice_items#find'
      get 'invoice_items/find_all' => 'invoice_items#find_all'
      resources :invoices, only: [:index, :show] do
        get '/invoice_items', to: 'invoices#invoice_items'
        get '/transactions',  to: 'invoices#transactions'
        get '/items',         to: 'invoices#items'
        get '/customer',      to: 'invoices#customer'
        get '/merchant',      to: 'invoices#merchant'
      end
      get 'invoices/random'   => 'invoices#random'
      get 'invoices/find'     => 'invoices#find'
      get 'invoices/find_all' => 'invoices#find_all'
      resources :items, only: [:index, :show] do
        get '/merchant', to: 'items#merchant'
      end
      get 'items/random'   => 'items#random'
      get 'items/find'     => 'items#find'
      get 'items/find_all' => 'items#find_all'
      resources :merchants, only: [:index, :show] do
        get '/items',                           to: 'merchants#items'
        get '/invoices',                        to: 'merchants#invoices'
        get '/favorite_customer',               to: 'merchants#favorite'
        get '/revenue',                         to: 'merchants#single_revenue'
        get '/customers_with_pending_invoices', to: 'merchants#pending'
      end
      get 'merchants/random'       => 'merchants#random'
      get 'merchants/find'         => 'merchants#find'
      get 'merchants/find_all'     => 'merchants#find_all'
      get 'merchants/most_revenue' => 'merchants#by_revenue'
      get 'merchants/most_items'   => 'merchants#by_items'
      get 'merchants/revenue'      => 'merchants#revenue_date'
      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions#invoice'
      end
      get 'transactions/random'   => 'transactions#random'
      get 'transactions/find'     => 'transactions#find'
      get 'transactions/find_all' => 'transactions#find_all'
    end
  end
end
