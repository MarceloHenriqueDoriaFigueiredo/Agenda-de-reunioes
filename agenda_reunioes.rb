# Reuniões
@minhas_reunioes = [
    {tema: "Definição de contratos", tipo: "Informativa", local: "Empresa", duracao: "15:30 as 17 hr"},
    {tema: "Metas alcançadas", tipo: "Feedback", local: "Atráves do Goole Meet", duracao: "19:00 as 21:00 hr"},
    {tema: "Solicitação de novos recursos", tipo: "Pedidos", local: "Empresa", duracao: "07:00 as 09:00 hr"}
]

# Todas as reuniões marcadas
def todas_as_reunioes
    @minhas_reunioes.each do |reunioes|
        puts "#{reunioes[:tema]} - #{reunioes[:tipo]} - #{reunioes[:local]} - #{reunioes[:duracao]}"
    end
    puts "-----------------------"
end

# Adicionar uma nova reunião
def adiconar_reuniao
    print "Tema: "
    tema = gets.chomp
    print "Tipo: "
    tipo = gets.chomp
    print "Local: "
    local = gets.chomp
    print "Duração: "
    duracao = gets.chomp

    @minhas_reunioes << {tema: tema, tipo: tipo, local: local, duracao: duracao}
end

# Saber detalhes de uma reunião em especifico
def ver_reuniao_especifica
    print "Qual reunião você deseja ver: "
    tema = gets.chomp
    @minhas_reunioes.each do |reunioes|
        if reunioes[:tema].downcase.include?(tema.downcase)
            puts "#{reunioes[:tema]} - #{reunioes[:tipo]} - #{reunioes[:local]} - #{reunioes[:duracao]}"
        break
        end
        puts "----------------"
    end
end

# Editar informações de uma reunião
def editar_reuniao
    print "Qual reunião você deseja editar: "
    tema = gets.chomp

    @minhas_reunioes.each do |reunioes|
        if reunioes[:tema].downcase.include?(tema.downcase)
            print "Informe um novo tema (Se quiser manter o mesmo tema aperte enter): "
            tema_salvo = reunioes[:tema]
            reunioes[:tema] = gets.chomp
            reunioes[:tema] = reunioes[:tema].empty? ? tema_salvo : reunioes[:tema]

            print "Infome um novo tipo (Se quiser manter o mesmo tema aperte enter): "
            tipo_salvo = reunioes[:tipo]
            reunioes[:tipo] = gets.chomp
            reunioes[:tipo] = reunioes[:tipo].empty? ? tipo_salvo : reunioes[:tipo]

            print "Informe o local da reunião (Se quiser manter o mesmo local aperte enter: "
            local_salvo = reunioes[:local]
            reunioes[:local] = gets.chomp
            reunioes[:local] = reunioes[:local].empty? ? local_salvo : reunioes[:local]

            print "Informe a nova duração da reunião (Se quiser manter a mesma duração aperte enter: "
            duracao_salvo = reunioes[:duracao]
            reunioes[:duracao] = gets.chomp
            reunioes[:duracao] = reunioes[:duracao].empty? ? duracao_salvo : reunioes[:duracao]
        end
    end
end

# Remover reunião
def remove_reuniao
    print "Qual reunião deseja remover: "
    tema = gets.chomp

    @minhas_reunioes.each do |reunioes|
        if reunioes[:tema].downcase.include?(tema.downcase)
            indice = @minhas_reunioes.index(reunioes)
            @minhas_reunioes.delete_at(indice)
            break
        end
    end
end

loop do
    puts "Olá, seja bem vindo a sua agenda de reuniões, por favor digite uma das opções a seguir"
    puts "1 - Ver todas reuniões marcadas"
    puts "2 - Adicionar uma nova reunião"
    puts "3 - Saber detalhes de uma reunião em especifico"
    puts "4 - Editar informações de uma reunião"
    puts "5 - Remover uma reunião"
    puts "0 - Sair da agenda de reuniões"

    reunião = gets.chomp.to_i
    case
    when reunião == 0
        puts "Você saiu da agenda de reuniões, até breve!"
        break
    when reunião == 1
        todas_as_reunioes
    when reunião == 2
        adiconar_reuniao
    when reunião == 3
        ver_reuniao_especifica
    when reunião == 4
        editar_reuniao
    when reunião == 5
        remove_reuniao
    else
        puts "Você digitou a opção errada! Por favor use as funções que o sistema apresenta!"
    end
end