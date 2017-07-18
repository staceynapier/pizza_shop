require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza.rb' )

#INDEX
get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

#NEW
get '/pizzas/new' do
  @pizzas = Pizza.all
  erb(:new)
end

#CREATE
post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
end

#SHOW
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#EDIT
get '/pizzas/:id/edit' do
  @pizza = Pizza.find( params[:id])
  erb(:edit)
end

# #UPDATE
post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update
  erb(:update)
end

# #DESTROY

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete
  redirect to '/pizzas'
end


