class TasksController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
      @tasks =Task.all
  end

  def show
  end

  def new
      @task =Task.new
  end

  def create
      @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクが作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが作成されていません'
      render :new
    end
  end

  def edit
  end

  def update
      if @task.update(task_params)
          flash[:success] = 'Task は正常に編集されました'
          redirect_to @task
      else
          flash.now[:danger] = 'Task は編集されませんでした'
          render :edit
      end
  end

  def destroy
      @task.destroy
      
      flash[:success] ='Task は正常に削除されました'
      redirect_to tasks_url
  end
  
 private
 
 def set_message
   @task=task.find(params[:id])
 end
 
 def task_params
   params.require(:task).permit(:content)
 end
end

