module V1
  class ToDoController < ApplicationController
    def index
      @todos = ToDo.all
      render json: @todos
    end
  end
end