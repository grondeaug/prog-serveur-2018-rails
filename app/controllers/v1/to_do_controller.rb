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

    def update
      @todo = ToDo.find(params[:id])
      @todo&.update_attributes(to_do_update_params)
      render json: @todo
    end

    def destroy
      @todo = ToDo.find(params[:id])
      if @todo.destroy
        head :no_content, status: :ok
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end

    private

      # Handles the safe parameters to avoid injections
      def to_do_params
        params.require(:todo).permit(%i( id owner content ))
      end

      # Handles the safe parameters to avoid injections
      def to_do_update_params
        params.require(:todo).permit(%i( owner content ))
      end
  end
end