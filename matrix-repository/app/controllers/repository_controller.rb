require 'task_stack'

class RepositoryController < ApplicationController

  # POST /pair_in
  # This key received is a little different because it
  # are the line or column index
  def pair_in
    # Add into singleton because rails destroy all data after each request
    TaskStack.instance.put(params[:key], params[:content])
  end

  # GET /pair_out
  # Key is ixj to i and j integers
  def pair_out
    tasks = TaskStack.instance.pop(params[:key])

    render json: tasks.to_json
  end

  # GET /read_pair
  # Key is ixj to i and j integers
  def read_pair
    tasks = TaskStack.instance.get(params[:key])

    render json: tasks.to_json
  end

  # GET /read_all
  # Extra method:
  # Read all pairs of repository
  def read_all
    tasks = TaskStack.instance.all

    render json: tasks.to_json
  end

  # GET /reset
  # Clean all data
  def reset
    tasks = TaskStack.instance.clear

    redirect_to action: 'read_all'
  end

  private

  def repository_params
    params.permit_all_parameters
  end
end
