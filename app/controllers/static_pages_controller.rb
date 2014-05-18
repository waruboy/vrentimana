class StaticPagesController < ApplicationController
  def index

  end

  def search
    @query = params[:q]

  end
end
