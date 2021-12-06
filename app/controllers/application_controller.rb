class ApplicationController < Sinatra::Base
  set default_content_type: "application/json"
  
# user request  
  
  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end

  post '/users' do
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
    )
    user.to_json
  end


# notebooks request

  get '/:user_id/notebooks' do
    notebooks = Notebook.where('user-id=?', params[:user_id])
    notebooks.to_json
  end

  get '/notebooks/:id' do
    notebook = Notebook.find(params[:id])
    notebook.to_json
  end

  post '/:user_id/notebooks' do
    notebook = Notebook.create(
      title: params[:title],
      user_id: params[:user_id]
    )
    notebook.to_json
  end
    
  patch '/notebooks/:id' do
    notebook = Notebook.find(params[:id])
    notebook.update(
      title: params[:title]
    )
    notebook.to_json
  end

  delete '/notebook/:id' do 
    notebook = Notebook.find(params[:id])
    notebook.destroy
    notebook.to_json
  end

# notes request

  get '/:notebook_id/notes' do
    notes = Note.where('notebook_id=?', params[:notebook_id])
    notes.to_json
  end

  get '/notes/:id' do
    note = Note.find(params[:id])
    note.to_json
  end

  post '/:notebook_id/notes' do
    note = Note.create(
      title: params[:title],
      content: params[:content],
      notebook_id: params[:notebook_id],
      favorite: false
    )
    note.to_json
  end
  
  patch '/notes/:id' do
    note = Note.find(params[:id])
    note.update(
      title: params[:title],
      content: params[:content]
    )
    note.to_json
  end

  ## for switching notebook
  patch '/:notebook_id' do
    note = Note.find_by(notebook_id: params[:notebook_id])
    note.update(notebook_id: params[:notebook_id])
  end
  # ***********************

  delete '/notes/:id' do 
    note = Note.find(params[:id])
    note.destroy
    note.to_json
  end
  
#   get '/bakeries/:id' do
#     bakery = Bakery.find(params[:id])
#     bakery.to_json(include: :baked_goods)
#   end

#   get '/baked_goods/by_price' do
#     # see the BakedGood class for the  method definition of `.by_price`
#     baked_goods = BakedGood.by_price
#     baked_goods.to_json
#   end

#   get '/baked_goods/most_expensive' do
#     # see the BakedGood class for the  method definition of `.by_price`
#     baked_good = BakedGood.by_price.first
#     baked_good.to_json
#   end

#   post '/baked_goods' do
#     baked_good = BakedGood.create(
#       name: params[:name],
#       price: params[:price],
#       bakery_id: params[:bakery_id]
#     )
#     baked_good.to_json
#   end

#   patch '/bakeries/:id' do
#     bakery = Bakery.find(params[:id])
#     bakery.update(
#       name: params[:name]
#     )
#     bakery.to_json
#   end

#   delete '/baked_goods/:id' do 
#     baked_good = BakedGood.find(params[:id])
#     baked_good.destroy
#     baked_good.to_json
#   end
end
