RailsAdmin.config do |config|

  config.model Article do
    edit do
      field :title, :string
      field :description, :ck_editor
      field :locale, :string
      field :private, :boolean
      field :photo, :carrierwave
    end
  end
  
  config.model Story do
    edit do
      field :title, :string
      field :description, :ck_editor
      field :locale, :string
      field :private, :boolean
      field :photo, :carrierwave
    end
  end
  
  config.authorize_with :pundit

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

  end

  config.authorize_with do |controller|
    redirect_to main_app.root_path unless current_user && current_user.admin
  end

end
