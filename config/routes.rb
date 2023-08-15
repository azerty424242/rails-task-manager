Rails.application.routes.draw do
  # 🤔 I don't understand why http://localhost:3000/tasks/new only works in that order.

  # 5. As a user, I can add a new task
  get '/tasks/new', to: 'tasks#new', as: :new_task
  post '/tasks', to: 'tasks#create'
  # 4. As a user, I can view the details of a task
  get '/tasks/:id', to: 'tasks#show', as: :task
  # 3. As a user, I can list tasks
  get '/tasks', to: 'tasks#index'
  # 6 - As a user, I can edit a task
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch '/tasks/:id', to: 'tasks#update'
  # 7 - As a user, I can delete a task
  delete '/tasks/:id', to: 'tasks#destroy', as: :delete_task


  # REFACTO :
  # resources :tasks
end
