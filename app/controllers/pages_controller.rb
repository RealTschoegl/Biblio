class PagesController < ApplicationController
  load_and_authorize_resource

  def show
    @guy = User.first
  end
end
