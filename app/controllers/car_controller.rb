class CarController < ApplicationController
  get '/:id/create_car' do
    erb :'car/create'
  end
  post '/create_car' do
    
    errors?
    if errors?
      erb :'car/create'      
    else
      redirect("/#{session[:user_id]}/all_cars")
    end
  end

  get '/:id/all_cars' do

    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'car/view_all'

    else
      erb :failure
    end
  end

  get '/:id/delete' do
    if logged_in?
      erb :'car/delete'
      
    else
      erb :failure
    end
  end
  delete '/:id/delete' do    
    if logged_in?
      params[:cars].each do |ids|
        car = Car.find_by(id: ids)
        car.destroy  
             
      end 
      redirect("#{session[:user_id]}/delete")     
    else
      erb :failure
    end
  end
  get '/:id/edit' do
    if logged_in?
      erb :'car/select'
    else
      erb :failure
    end
  end

  get '/:id/:car/modify' do
    # binding.pry
    @car = Car.find_by(id: params[:car])
    if logged_in?
      erb :'car/edit'
    else
      erb :failure
    end
    
  end
  patch '/:car/edit' do
    params.delete(:_method)
    # binding.pry
    @car = Car.find_by(id: params[:car])
    if errors?
      erb :'car/edit'
    else
      redirect("/#{session[:user_id]}/all_cars") 
    end
    
  end
end