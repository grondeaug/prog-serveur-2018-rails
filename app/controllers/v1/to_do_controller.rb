module V1
  class ToDoController < ApplicationController
    def index
      @todos = ToDo.order("created_at DESC")
      render json: @todos
    end

    def create
      @todo = ToDo.create(to_do_params)
      render json: @todo
    end

    private

      # Handles the safe parameters to avoid injections
      def to_do_params
        params.require(:todo).permit(%i( id owner content ))
      end
  end
end