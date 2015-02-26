class RecipesController < RestfullController

  def collection
    end_of_association_chain.scoped_to(current_account)
  end

end
