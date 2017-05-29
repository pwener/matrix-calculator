require './task_stack'

class RepositoryController < ApplicationController

  # POST /pair_in
  def pair_in
    # Add into singleton because rails destroy all data after each request
    TaskStack.instance.put(index, content)
  end

  # GET /pair_out
  def pair_out
  end

  # GET /read_pair
  def read_pair
    @tasks = TaskStack.instance.get(params[:index])
  end

end
