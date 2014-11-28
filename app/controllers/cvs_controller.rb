class CvsController < ApplicationController
  before_action :set_cv, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:new, :create, :update, :destroy, :edit]

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
    respond_to do |format|
      if @cv.update(cv_params)
        format.html { redirect_to cvs_path, notice: 'Cv was successfully updated.' }
        format.json { render :index, status: :ok, location: @cv }
      else
        format.html { render :edit }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:cv).permit(:name, :profile, :title, :stackoverflow_reputation, :blog, :avatar)
    end

    def authenticate_admin
      unless current_user.admin
        redirect_to cvs_url, notice: 'Admin access required.'
      end
    end
end
