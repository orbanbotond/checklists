class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fill_quick_search

protected

  def fill_quick_search
    @quick_search = QuickSearch.new
    if params[:quick_search].present? && params[:quick_search][:search_term].present?
      @quick_search.search_term = params[:quick_search][:search_term]
    else
    end
  end

end
