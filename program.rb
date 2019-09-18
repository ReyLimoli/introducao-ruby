SAIR = 4

def imprime_vagas()
  vagas.each_with_index do |vaga, index|
    puts "Vaga ##{index + 1}"
    puts vaga
    puts '--------------------------'
  end
end

def vaga_contem?(vaga, texto)
  return false if vaga.nil?
  (vaga[:titulo].downcase().include?(texto.downcase()) || 
   vaga[:descricao].downcase().include?(texto.downcase()))
end

puts 'Boas Vindas - Sistema de Vagas'

puts '#1 - Inserir uma vaga'
puts '#2 - Ver todas as vagas'
puts '#3 - Busca'
puts "##{SAIR} - Sair"

print 'Escolha uma opção: '
opcao = gets().to_i()
vagas = []

while(opcao != SAIR) do
  if(opcao == 1)
    print 'Informe o título da vaga: '
    titulo = gets().chomp()
    print 'Informe a descrição da vaga: '
    descricao = gets().chomp()
    #vaga = "titulo: " + titulo + " descricao: " + descricao 
    #vaga = "titulo: #{titulo}\ndescricao: #{descricao}"
    vaga = {titulo: titulo, descricao: descricao }
    vagas << vaga
  elsif opcao == 2

   imprime_vagas()
  elsif opcao == 3

    print 'Que termo você está buscando?'
    termo = gets().chomp()
    vagas_encontradas = []
=begin  
    vagas.each do |v|
      if v[:titulo].downcase().include?(termo.downcase()) || 
         v[:descricao].downcase().include?(termo.downcase())
        vagas_encontradas << v
      end
    end
=end
    vagas_encontradas = vagas.select do |v| 
      vaga_contem?(v, termo)
    end

    puts "Resultado #{vagas_encontradas.length } vagas encontradas"
    imprime_vagas(vagas_encontradas)
  end
  print 'Escolha uma nova opção: '
  opcao = gets().to_i()
end

puts 'Adeus...'