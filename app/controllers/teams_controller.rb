class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :add_player, :remove_player]
  before_action :authenticate_user!

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.where(created_by_id: current_user.id) # Teams this user owns
    @teams_other = Team.find(current_user.player_team_rs.pluck(:team_id)) # Other Teams this user associates to
  end

  def remove_player
    result = PlayerTeamR.where(user_id: params[:user_id], team_id: @team.id).destroy_all

    if result
      flash[:success] = "Player #{params[:user_name]} was successfully removed."
    else
      flash[:error] = "Player #{params[:user_name]} could not be removed."
    end
    redirect_to @team
  end

  # def search_players
  #
  #
  #   redirect_to @team
  # end

  def add_player
    puts 22
    begin
      relationship = PlayerTeamR.new(team_id: @team.id, user_id: params[:user_id])
      relationship.save!

      flash[:success] = "Player was successfully added."
      redirect_to @team
    rescue ActiveRecord::RecordNotUnique => e
      flash[:error] = "Player is already on the Team."
      redirect_to @team
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @q = User.ransack(params[:q])

    @user_search = Array.new
    @user_search = @q.result if params[:q] and params[:q][:name_or_phone_or_email_cont].length > 0


    @players = User.find(@team.player_team_rs.pluck(:user_id))
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    @team.created_by_id = current_user.id

    respond_to do |format|
      if @team.save!

        # Add creator to PlayerTeamR table
        relationship = PlayerTeamR.new(team_id: @team.id, user_id: @team.created_by_id)
        relationship.save!

        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
