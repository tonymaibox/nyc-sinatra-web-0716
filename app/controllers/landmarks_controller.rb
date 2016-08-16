class LandmarksController < ApplicationController

	get '/landmarks/new' do
		erb :'/landmarks/new'
	end

	post '/landmarks' do
		@landmark = Landmark.create(params[:landmark])
		erb :'/landmarks/index'
	end

	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'/landmarks/index'
	end
	
	get '/landmarks/:id/edit' do
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/edit'
	end
	
	get '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/show'
	end

	patch '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		@landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
		redirect "/landmarks/#{@landmark.id}"
	end
end