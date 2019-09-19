require_relative "estagio"


SAIR = 4

def imprime_vagas(vagas_para_imprimir)
  vagas_para_imprimir.each_with_index do |vaga, index|     
    puts "Vaga ##{index + 1}"
    vaga.to_s  
  end
end
=begin
def ativar_vagas(vagas_para_ativar)
  vagas_para_ativar.each_with_index do |vaga, index|
    if vaga.ativa?() == false
      puts "Vaga ##{index + 1}"
      puts vaga.titulo
      puts vaga.descricao
      puts 'Deseja ativar essa vaga? y/n'
      ativar = gets().chomp()
      if ativar == 'y'
        vaga.ativar!()
        puts 'Vaga ativada'
      else
        puts 'Vaga não ativada'
      end
    end
  end
end
=end
def menu
  puts '#1 - Inserir uma vaga'
  puts '#2 - Ver todas as vagas'
  puts '#3 - Busca'
  #puts '#4 - Ativar vaga'
  puts "##{SAIR} - Sair"
end

puts 'Boas Vindas - Sistema de Vagas'

menu()
print 'Escolha uma opção: '
opcao = gets().to_i()
vagas = []

while(opcao != SAIR) do
  if(opcao == 1)
    puts 'Informe o tipo da vaga: '
    puts "#1 Comum \n#2 Estágio"
    tipo_vaga = gets().to_i
    print 'Informe o título da vaga: '
    titulo = gets().chomp()
    print 'Informe a descrição da vaga: '
    descricao = gets().chomp()
    print 'Informe a empresa: '
    empresa_nome = gets().chomp()
    empresa = Empresa.new(empresa_nome)
    if tipo_vaga == 2
      print 'Informe o curso: '
      curso = gets().chomp()
      print 'Informe o prazo: '
      prazo = gets().chomp()
      vaga = Estagio.new(titulo, descricao, curso, prazo, empresa.nome)      
    else
      vaga = Vaga.new(titulo, descricao, empresa.nome)      
    end    
    
    vagas << vaga

  elsif opcao == 2

   imprime_vagas(vagas)

  elsif opcao == 3
    print 'Que termo você está buscando?'
    termo = gets().chomp()
    vagas_encontradas = []

    vagas_encontradas = vagas.select do |vaga|
      vaga.include?(termo)
    end

    puts "Resultado #{vagas_encontradas.length } vagas encontradas"
    imprime_vagas(vagas_encontradas)

=begin
  elsif opcao == 4
    ativar_vagas(vagas)
=end
  end

  print 'Escolha uma nova opção: '
  opcao = gets().to_i()

end

puts 'Adeus...'