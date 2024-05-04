namespace :dev do
  desc "TODO"
  task setup: :environment do
    show_spinner("Apgando DB ... ", "DB apagado com sucesso! ") { %x(rails db:drop:_unsafe )}
    show_spinner("Criando DB ... ", "DB criado com sucesso! ") { %x(rails db:create )}
    show_spinner("Migrando DB ... ", "DB migrado com sucesso! ") { %x(rails db:migrate )}
    show_spinner("Populando DB ... ", "DB populado com sucesso! ") { %x(rails dev:set_tasks )}
  end

  desc "Populando DB"
  task set_tasks: :environment do
    list_of_exemple = [
      {
        description: 'Arrumar a cama',
        date: Date.new(2024, 5, 24)

      },
      {
        description: 'Escovar o dente',
        date: Date.new(2024, 5, 25)

      },
      {
        description: 'Prova de Geografia',
        date: Date.new(2024, 6, 13)

      }
    ]

    list_of_exemple.each do |exemple|
      Task.find_or_create_by!(exemple)

    end
  end

  private

  # first_msg, last_msg
  def show_spinner(f_msg, l_msg)
    spinner = TTY::Spinner.new("[:spinner] #{f_msg}")
    spinner.auto_spin
    yield
    spinner.success("#{l_msg}")

  end
end
