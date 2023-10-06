class DirectorsController < ApplicationController
  before_action :set_director, only: %i[ show edit update destroy ]

  # GET /directors or /directors.json
  def index
    @directors = Director.all
  end

  # GET /directors/1 or /directors/1.json
  def show
    @director = Director.find(params.fetch(:id))

    render "directors/show"
  end

  # GET /directors/new
  def new
    @director = Director.new
  end

  # GET /directors/1/edit
  def edit
    @director = Director.find(params.fetch(:id))

    render "directors/edit"
  end

  # POST /directors or /directors.json
  def create
    director_attributes = params.require(:director).permit(:name, :bio, :date_of_birth)
    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to directors_path, notice: "Director created successfully."
    else
      render "directors/new"
    end
  end

  # PATCH/PUT /directors/1 or /directors/1.json
  def update
    director_attributes = params.require(:director).permit(:name, :bio, :date_of_birth)
    director = Director.new(director_attributes)

    if director.valid?
      director.save
      redirect_to("/directors/#{director.id}", :notice => "Director updated successfully.")
    else
      redirect_to("/directors/#{director.id}", :alert => "Director failed to update successfully.")
    end
  end

  # DELETE /directors/1 or /directors/1.json
  def destroy
    @director = Director.find(params.fetch(:id))

    director.destroy

    redirect_to directors_url, notice: "Director deleted successfully."
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_director
  #     @director = Director.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def director_params
  #     params.require(:director).permit(:name, :date_of_birth, :bio)
  #   end
end
