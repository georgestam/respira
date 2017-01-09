class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]

  def index
    x = [0,2,4,6]


    @result = pair_elements(x)
  end

end


def pair_elements(array)

    new_array = []
    i = 0
    array.each do |int|
        x = 1
        size_array = array.size - 1
        size_array.times do
          new_array << [int, array[i+x] ]

          x += 1
        end

        i += 1
    end

    new_array

end
