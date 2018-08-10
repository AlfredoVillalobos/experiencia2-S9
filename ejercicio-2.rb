require 'date'
class Course
  def initialize(name, start_date, end_date)
    @name = name
    begin
      @start_date = Date.parse(start_date)
      @end_date = Date.parse(end_date)
    rescue ArgumentError => e
      print "Ocurrio el siguiente error #{e}"
    end
  end

  def start_before_at?(date)
    if date >= Date.parse('01/01/2019')
      raise 'La fecha ingresada es incorrecta'
    else
      @start_date < date
    end
  end

  def en_after_at?(date)
    if date >= Date.parse('01/01/2019')
      raise 'La fecha ingresada es incorrecta'
    else
      @end_date > date
    end
  end

  def to_s
    "#{@name}: #{@start_date},#{@end_date}"
  end
end

def llamar_course
  curso = []
  file = File.open('cursos.txt', 'r')
  data = file.readlines
  file.close
  data.each do |lines|
  ls = lines.split(', ')
  curso << Course.new(ls[0], ls[1], ls[2])
  end
  curso
end

c = llamar_course
ahora = Date.today
futura = Date.today + (2 * 365)

print "#{c}"
print c.first.start_before_at?ahora
begin
    print c.first.start_before_at?futura
rescue StandardError => cuek
    print "#{cuek}\n"
end
