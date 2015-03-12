class RecipesController < RestfullController

  def index
    if @quick_search.search_term.present?
      service = AutosuggestSearch.new(current_account)
      @recipes = service.execute(@quick_search.search_term)
      authorize @recipes
    else
      super
    end
  end

  def end_of_association_chain
    super.scoped_to(current_account)
  end

end
