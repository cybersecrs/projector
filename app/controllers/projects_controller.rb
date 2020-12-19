class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_projects,  only:   [:edit, :update, :destroy]
  before_action :set_project,        only:   [:show]


  # GET /projects

  def index
    @projects = Project.where(aktivan: true).all
  end


  # GET /projects/1

  def show
  end


  # GET /projects/new

  def new
    @project = Project.new
  end


  # GET /projects/1/edit

  def edit
    @project = @projects.find(params[:id])
  end


  # POST /projects

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end


  # PATCH/PUT /projects/1

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /projects/1  

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end


  private


    # Use callbacks to share common setup or constraints between actions.

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user_projects
    @projects = Project.where(user_id: current_user.id).all
  end

    # Rais proverava polja koja mu mi dozvolimo

    def project_params
      params.require(:project).permit(:naziv, :opis, :ukupno, :do_sada, :aktivan)
    end
end
