shared_examples "Restfull Resource Routes" do |resource|
  singularized_resource = resource.to_s.downcase.singularize
  pluralized_resource = resource.to_s.downcase.pluralize

  specify "index" do
    if pluralized_resource == singularized_resource
      path = "#{pluralized_resource}_index_path"
    else
      path = "#{pluralized_resource}_path"
    end

    expect(:get => send(path)).
      to route_to :controller => "#{pluralized_resource}", :action => "index"
  end
  specify "show" do
    expect(:get => send("#{singularized_resource}_path", -1)).
      to route_to :controller => "#{pluralized_resource}", :action => "show", :id => '-1'
  end
  specify "new" do
    expect(:get => send( "new_#{singularized_resource}_path")).
      to route_to :controller => "#{pluralized_resource}", :action => "new"
  end
  specify "create" do
    # expect(:post => #{singularized_resource}_path()).
    #   to route_to(:controller => "#{pluralized_resource}", :action => "create")
  end
  specify "update" do
    expect(:put => send( "#{singularized_resource}_path", -1)).
      to route_to(:controller => "#{pluralized_resource}", :action => "update", :id => '-1')
  end
  specify "edit" do
    expect(:get => send( "edit_#{singularized_resource}_path", -1)).
      to route_to(:controller => "#{pluralized_resource}", :action => "edit", :id => '-1')
  end
  specify "destroy" do
    expect(:delete => send( "#{singularized_resource}_path", -1)).
      to route_to(:controller => "#{pluralized_resource}", :action => "destroy", :id => '-1')
  end
end