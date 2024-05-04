class WelcomeController < ApplicationController
  def index
    set_tasks_list()

  end

  def completed_tasks
    @check = params[:completed]
    value = @check[@check.keys.first].to_i
    @retorno = value


    puts "Check: #{@check}"
    puts "Valor: #{value}"
    puts "Retorno: #{@retorno}"

  end

  private

  def set_tasks_list
    @task_list = Task.all

  end

  def checked_params

  end
end
