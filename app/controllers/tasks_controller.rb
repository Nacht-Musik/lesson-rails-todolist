class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks, only: [:index, :edit, :create, :update, :new]
  before_action :set_users, only: [:index, :edit, :create, :update, :new]
  before_action :set_statuses, only: [:index, :edit, :create, :update, :new, :show, :mytasks]
  before_action :set_categories, only: [:index, :edit, :create, :update, :new, :show, :mytasks]
  before_action :set_mytasks, only: [:edit, :create, :update, :new, :mytasks]

  # GET /tasks
  # GET /tasks.json
  def index
    # @tasks = Task.all
  end

  def mytasks
    @my_tasks = current_user.tasks if user_signed_in?
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    @task.save

    ### Original code
    # @task = current_user.tasks.build(task_params)
    #
    # respond_to do |format|
    #   if @task.save
    #     format.html { redirect_to @task, notice: 'Task was successfully created.' }
    #     format.json { render :show, status: :created, location: @task }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)

    # Original code
    # respond_to do |format|
    #   if @task.update(task_params)
    #     @task.update(task_params)
    #     # format.html { redirect_to @task, notice: 'Task was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @task }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to mytasks_url, notice: 'Task was successfully destroyed.' }
      # format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_mytasks
      @my_tasks = current_user.tasks if user_signed_in?
    end

    def set_tasks
      @tasks = Task.all
    end

    def set_users
      @users = User.all
    end

    def set_statuses
      @statuses = Status.all
    end

    def set_categories
      @categories = Category.all
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :status_id, :category_id)
    end
end
