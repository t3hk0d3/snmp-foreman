Foreman::Application.routes.draw do
	resources :watches

	resources :mibs do
		get 'import', :on => :collection
	end

	resources :servers do
		get 'scan', :on => :member

		resources :watches
	end

end
