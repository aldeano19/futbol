class PagesController < ApplicationController
  # before_action :authenticate_user!

  def index;
    @games = Game.all
    @teams = Team.all
  end

end
