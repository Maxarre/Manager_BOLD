class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new(params[:task])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @list = List.find(params[:list_id])
    @user = current_user
    @task.list = @list
    if @task.save
      redirect_to list_path(@list)
    else
      render 'lists#show'
    end
  end

  def complete
    @list = List.find(params[:id])
    @user = current_user
    @task = Task.find(params[:list_id])
    @task.complete = true
    # @task.save
    # redirect_to list_path(list)
    if @task.save
      respond_to do |format|
        ApplicationMailer.with(user: @user).completed_task_mail.deliver_now
        format.html { redirect_to list_path(@list) }
        format.json { render json: @user, status: :created, location: @user }
      end
    else
      render 'lists#show'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
    redirect_to tasks_path
  end

  def destroy
    list = List.find(params[:id])
    @task = Task.find(params[:list_id])
    @task.destroy
    redirect_to list_path(list)
  end

  private

  def task_params
    params.require(:task).permit(:name, :complete, :list_id)
  end
end
