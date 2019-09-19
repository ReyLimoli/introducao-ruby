require_relative 'vaga'

class Estagio < Vaga
  attr_accessor :prazo, :curso

  def initialize(titulo, descricao, curso, prazo, empresa)
  super(titulo, descricao, empresa)        
    @curso = curso
    @prazo = prazo
  end

  def to_s
    puts "\n#{titulo}\n\n#{descricao}\n\n#{curso}\n\nPrazo: #{prazo} meses\n\n#{empresa}\n\n"
  end

end