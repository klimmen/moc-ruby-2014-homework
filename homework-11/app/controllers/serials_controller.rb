class SerialsController < ApplicationController
  before_action :set_serial, only: [:show, :edit, :update, :destroy]
  before_action :set_genre, only: [:genre]
  # GET /serials
  def index
    @serials = Serial.all
    @genres = Genre.all
  end

  # GET /serials/1
  def show
  end

  # GET /serials/new
  def new
    @genres = Genre.all
  end

  # GET /serials/1/edit
  def edit
    @genres = Genre.all
  end

  # POST /serials
  def create
    @serial = Serial.new(serial_params)
    genre_params.each_value do |genre_id| 
      @genre_movie_serial = GenreMovieSerial.new
      @genre_movie_serial.resource = @serial
      @genre_movie_serial.genre_id = genre_id
      @genre_movie_serial.save
    end
    redirect_to serial_path(@serial)
  end

  # PATCH/PUT /serials/1
  def update
    @serial.update(serial_params)
    @serial.genre_movie_serial.all.delete_all
    genre_params.each_value do |genre_id|
      @genre_movie_serial = GenreMovieSerial.new
      @genre_movie_serial.resource = Serial.find_by serial_params
      @genre_movie_serial.genre_id = genre_id
      @genre_movie_serial.save
    end
    redirect_to @serial
  end
  
  # DELETE /serials/1
  # DELETE /serials/1.json
  def destroy
    @serial.destroy
    respond_to do |format|
      format.html { redirect_to serials_url, notice: 'Serial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # GET /movies/:name
  def genre
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_genre
      @genre_serials = Genre.find_by(:name => params[:name])
    end

    def set_serial
      @serial = Serial.find(params[:id])
    end

   def genre_id
      genres_id = {}
      params[:serial_genre].each do |key, value|
       if !key.slice("genre").nil?
         genres_id[key] = value
       end
      end
      genres_id
    end

    def serial_params
      params.require(:serial_genre).permit(:name)
    end
    
    def genre_params
      params.require(:serial_genre).permit(*genre_id)
    end
end

