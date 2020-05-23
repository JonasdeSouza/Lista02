$total_of_approved = 0
$total_of_students = 0

def subjects()
  subjects_list = ['Calculo 1', 'Calculo 2', 'Calculo 3', 'Fisica 1', 'Fisica 2', 'Estrutura de Dados', 'Algoritmo e programacao de computadores', 'Tecnicas de programacao 1', 'Sistemas Digitais', 'Eletromagnetismo']
  return subjects_list.sample
end

def total_of_approved(number)
  $total_of_approved += number
end

def total_of_students(number)
  $total_of_students += number
end

class Classroom

  def initialize()
    @subject = subjects()
    @total_of_studentsl = rand(5..20)
    @students = []
    @subject_approved = 0
    for i in 1..@total_of_studentsl
      @matricula = rand(100000000..999999999)
      @nota = rand(0..10)
      if @nota >= 5
        @subject_approved += 1
      end
    @students.push({"#{@matricula}" => "#{@nota}"})
    end
    total_of_approved(@subject_approved)
    total_of_students(@total_of_studentsl)
  end

  attr_reader :subject, :total_of_studentsl
  def approved()
    return @subject_approved
  end

  def printa
    puts @subject
    puts @total_of_students
    puts @students
    puts @subject_approved
  end
end

def calculo(approved, total)
  return ((approved.to_f/total.to_f)*100)
end

puts "Digite a quantidade de turmas"
turmas = gets.to_i
turmas_total = Array.new(turmas)

for i in 0..(turmas-1) do
  aux = Classroom.new
  turmas_total.push(aux)
end

subjects_approved = {}
subjects_total = {}
result = []

for x in (turmas_total.size/2)..(turmas_total.size-1)
  aux2 = turmas_total[x]
  subjects_approved.store("#{aux2.subject}", "#{aux2.approved}")
  subjects_total.store("#{aux2.subject}", "#{aux2.total_of_studentsl}")
  result.push(aux2.subject)
  result.push(calculo(aux2.approved, aux2.total_of_studentsl))
end

puts ""
for z in result do
  if z.class == String
    print "Turma #{z}: "
    else print "aproximadamente #{z.to_i}% de alunos aprovados\n"
  end
end

puts "\nA porcentagem do total de alunos aprovados foi de aproximadamente #{calculo($total_of_approved, $total_of_students).to_i}%"
