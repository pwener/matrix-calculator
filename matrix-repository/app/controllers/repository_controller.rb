require 'task_stack'

class RepositoryController < ApplicationController

  # POST /pair_in
  def pair_in
    # Add into singleton because rails destroy all data after each request
    TaskStack.instance.put(params[:index], params[:content])
  end

  # GET /pair_out
  def pair_out
    tasks = TaskStack.instance.pop

    render json: tasks.to_json
  end

  # GET /read_pair
  def read_pair
    tasks = TaskStack.instance.get(params[:index])

    render json: tasks.to_json
  end

  # GET /read_all
  # Extra method:
  # Read all pairs of repository
  def read_all
    tasks = TaskStack.instance.all

    render json: tasks.to_json
  end

  private

  def repository_params
    params.permit_all_parameters
  end
end
