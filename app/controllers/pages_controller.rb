class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @user = User.new
    if current_user
      current_user.destroy
    end



    # x = [0,2,4,6]

    # @result = pair_elements(x)
  end

  def create


    @user = User.new(user_params)
    raise

    if @user.save

      flash[:notice] = "Your subscription was successful!"
      UserMailer.welcome(@user).deliver_now
      SubscribeToNewsletterService.new(@user).call
      raise
    else

      flash[:notice] = "Oops! Something went wrong please try again"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :name)
  end


end


# # onlne interivew exam
# def pair_elements(array)

#     new_array = []
#     i = 0
#     array.each do |int|
#         x = 1
#         size_array = array.size - 1
#         size_array.times do
#           new_array << [int, array[i+x] ]

#           x += 1
#         end

#         i += 1
#     end

#     new_array

# end
