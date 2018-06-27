class GameFormatsController < ApplicationController
  before_action :set_game_format, only: [:show, :edit, :update, :destroy]

  # GET /game_formats
  # GET /game_formats.json
  def index
    @game_formats = GameFormat.all
  end

  # GET /game_formats/1
  # GET /game_formats/1.json
  def show
  end

  # GET /game_formats/new
  def new
    @game_format = GameFormat.new
  end

  # GET /game_formats/1/edit
  def edit
  end

  # POST /game_formats
  # POST /game_formats.json
  def create
    @game_format = GameFormat.new(game_format_params)

    respond_to do |format|
      if @game_format.save
        format.html { redirect_to @game_format, notice: 'Game format was successfully created.' }
        format.json { render :show, status: :created, location: @game_format }
      else
        format.html { render :new }
        format.json { render json: @game_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_formats/1
  # PATCH/PUT /game_formats/1.json
  def update
    respond_to do |format|
      if @game_format.update(game_format_params)
        format.html { redirect_to @game_format, notice: 'Game format was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_format }
      else
        format.html { render :edit }
        format.json { render json: @game_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_formats/1
  # DELETE /game_formats/1.json
  def destroy
    @game_format.destroy
    respond_to do |format|
      format.html { redirect_to game_formats_url, notice: 'Game format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_format
      @game_format = GameFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_format_params
      params.require(:game_format).permit(:name, :min_players, :max_players, :half_time)
    end
end
