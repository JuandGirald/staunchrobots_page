class CvsController < ApplicationController
  before_action :set_cv, only: [:show, :edit, :update, :destroy]

  def index
    @cvs = Cv.all
  end

  def show
  end

  def new
    @cv = Cv.new
  end

  def edit
  end

  def create
    @cv = Cv.new(cv_params)

    respond_to do |format|
      if @cv.save
        format.html { redirect_to cvs_path, notice: 'CVS was successfully created.' }
        format.json { render :index, status: :created, location: @cv }
      else
        format.html { render :new }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cv.update(cv_params)
    respond_with(@cv)
  end

  def destroy
    @cv.destroy
    respond_to do |format|
      format.html { redirect_to cvs_url, notice: 'CVS was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cv
      @cv = Cv.find(params[:id])
    end

    def cv_params
      params.require(:cv).permit(:name, :profile, :title, :stackoverflow_reputation, :blog)
    end
end
