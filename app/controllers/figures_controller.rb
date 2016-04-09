class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?
    @figure.titles << Title.create(params[:title]) unless params[:title][:name].empty?
    @figure.save
    redirect to '/figures'
  end
end
