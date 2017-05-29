require 'task_stack'

class RepositoryController < ApplicationController

  # POST /pair_in
  def pair_in
    # Add into singleton because rails destroy all data after each request
    TaskStack.instance.put(params[:index], params[:content])
  end

  # GET /pair_out
  def pair_out
    puts "remove and return"
  end

  # GET /read_pair
  def read_pair
    tasks = TaskStack.instance.get(params[:index])
    puts tasks.to_json
    render json: tasks.to_json
  end

  private

  def repository_params
    params.permit_all_parameters
  end
end
