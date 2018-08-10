class Table
#   def initialize(name, valor1, valor2, valor3, valor4)
  def initialize(name, *valores)
    @name = name
    @valor1 = valores[0].to_i
    @valor2 = valores[1].to_i
    @valor3 = valores[2].to_i
    @valor4 = valores[3].to_i
  end
  def max_table
    v = [@valor1, @valor2, @valor3, @valor4]
    v_max = v.max
    v_dia = v.index(v_max) + 1
    print "Mesa con mayor valor: #{@name}\n"
    print "mayor recaudacion: #{v_max}\n"
    print "Dia con mayor valor: #{v_dia}\n"
  end

  def average
    (@valor1 + @valor2 + @valor3 + @valor4) / 4
  end
end

def llamar_tabla
  recaudaciones = []
  file = File.open('casino.txt', 'r')
  data = file.readlines
  file.close
  data.each do |lines|
  ls = lines.split(', ')
  recaudaciones << Table.new(*ls)
  end
  recaudaciones
end
t = llamar_tabla

t.each { |mayor_valor| print mayor_valor.max_table }

t.each { |promedio| print "#{promedio.average}\n" }
