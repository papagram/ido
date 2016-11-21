class TrainingsController < ApplicationController
  def index
  end

  def message
  end

  def tasks
    @tasks = Task.all
  end
end
