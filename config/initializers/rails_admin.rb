RailsAdmin.config do |config|

  config.model Article do
    edit do
      field :title, :string
      field :description, :ck_editor
      field :private, :boolean
      field :photo, :carrierwave
      field :locale, :enum do 
        enum_method do
          :locale_enum
        end  
      end
    end
  end
  
  config.model Story do
    edit do
      field :title, :string
      field :description, :ck_editor
      field :private, :boolean
      field :photo, :carrierwave
      field :locale, :enum do 
        enum_method do
          :locale_enum
        end  
      end
    end
  end
  
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  
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
