class HomeController < ApplicationController
  def index
    @presenter = HomePresenter.new(params)
  end
end
