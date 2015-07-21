class RecipisController < ApplicationController
  def index
    @recipes = if params[:keywords]
                 Recipi.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end
end
