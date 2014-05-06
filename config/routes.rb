Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource 'import_promotions', only: [:create, :new]
  end
end
