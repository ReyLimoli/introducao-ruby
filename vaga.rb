require_relative 'empresa'

class Vaga < Empresa
  attr_reader :descricao
  attr_writer :descricao
  attr_accessor :titulo, :candidatos, :empresa

  #construtor
  def initialize(titulo, descricao, empresa)
    @titulo = titulo
    @descricao = descricao
    @ativa = false
    @candidatos = []
    @empresa = empresa
  end

  def ativar!
    self.ativa = true 
  end

  def ativa?
    ativa()
  end

  def include?(t)
    titulo.downcase.include?(t) || descricao.downcase.include?(t)
  end

  def to_s
    puts "\n#{titulo}\n\n#{descricao}\n\n#{empresa}"
  end

  private

  attr_accessor :ativa
  
end