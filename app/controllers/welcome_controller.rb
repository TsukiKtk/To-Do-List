class WelcomeController < ApplicationController
  def index
    set_tasks_list()
    completed_tasks

  end

  def completed_tasks
    @check = params[:completed]
    @id_task_feita = @check.keys.first.scan(/\d+/).first.to_i

    value = @check[@check.keys.first].to_i
    @retorno = value

    # Quando voltar, pensar em colocar em um array as tasks que foram comepltas/enviadas para diferenciar o ID de cada
    # ex:
    #
    # tasks_completas = []
    # tasks_completas.push(@retorno) # Algo assim, pensa

    puts "Check: #{@check}"
    puts "Task Feita: #{@id_task_feita}"
    puts "Valor: #{value}"
    puts "Retorno: #{@retorno}"


  end

  private

  def set_tasks_list
    @task_list = Task.all

  end

end
