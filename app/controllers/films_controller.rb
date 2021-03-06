class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /films
  # GET /films.json
  def index
    # @films = Film.all
    if params[:search].blank?
      @views = "No value entered"
      response = HTTParty.get('https://swapi.co/api/films/')
      # byebug
      @films = JSON.parse(response.body)
    else
      @views = params[:search]
      response = HTTParty.get("https://swapi.co/api/films/?search=#{@views}")
      @films = JSON.parse(response.body)
    end 
  end

  # GET /films/1
  # GET /films/1.json
  def show
    episode_id = params[:id]
    response = HTTParty.get("https://swapi.co/api/films/?episode_id=#{episode_id}")
    @before = JSON.parse(response.body)
    @film = @before["results"][0]

    # loop for characters
    @charactersArray = []
    @before["results"][0]["characters"].each do |item|
      reqChar = HTTParty.get(item)
      @resChar = JSON.parse(reqChar.body)
      @charactersArray.push(@resChar)
    end
    
  end

  # GET /films/new
  def new
    # @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films
  # POST /films.json
  def create
    # @film = Film.new(film_params)

    # respond_to do |format|
    #   if @film.save
    #     format.html { redirect_to @film, notice: 'Film was successfully created.' }
    #     format.json { render :show, status: :created, location: @film }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @film.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    # respond_to do |format|
    #   if @film.update(film_params)
    #     format.html { redirect_to @film, notice: 'Film was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @film }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @film.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    # @film.destroy
    # respond_to do |format|
    #   format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      # @film = Film.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      # params.require(:film).permit(:title, :opening_crawl, :director, :producer, :release_date, :characters, :planets, :starships, :vehicles, :species, :user_id)
    end
end
