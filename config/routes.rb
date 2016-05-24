Spree::Core::Engine.routes.draw do
  # Add your extension routes here

  resources :shipments, only: [:create, :update] do
    member do
      put :deliver
    end
  end

end
