class GamesController < ApplicationController
  include GamesHelper

  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    if user_signed_in?
      @games = get_all_games_for_user(current_user)
    else
      @games = Game.all
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @team_a = @game.team_a
    @team_b = @game.team_b

    @team_a_players = @team_a.players
    @team_b_players = @team_b.players
  end

  # GET /games/new
  def new
    @game_team_player = GameTeamPlayer.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create

    # Here the params[:] will contain all info needed to create the players, teams, and the game. Build each one individually, then the game


    @game_team_player = GameTeamPlayer.new(game_team_player_params)
    raw_date = params[:date]
    @game_team_player.scheduled_date = DateTime.new(raw_date[:year].to_i, raw_date[:month].to_i, raw_date[:day].to_i, raw_date[:hour].to_i, raw_date[:minute].to_i)

    @game = @game_team_player.save!

    flash[:success] = "Game #{@game.id} was successfully added." if @game

    redirect_to game_path(@game)
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:scheduled_date, :where, :team_a_id, :team_b_id, :game_format_id)
    end

    def game_team_player_params

      allowed_attr = [:where, :game_format, :game_master, :team_a_name, :team_b_name, team_a_name_list: [], team_a_phone_list: [], team_b_name_list: [], team_b_phone_list: []]

      params.require(:game_team_player).permit(allowed_attr)
    end
end
