class BankAccount
  def initialize(nome, cpf, telefone, idade, senha)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
    @senha = senha
    @numero_conta = rand(999..9999)
    @saldo = 0.00

  end

  def Depositar(quantia)
    @saldo += quantia
    puts "Dinheiro depositado, seu saldo agora é de R$#{@saldo}"
  end

  def Sacar(quantia)
    @saldo -= quantia
    puts "Dinheiro sacado, seu saldo agora é de R$#{@saldo}"
  end

  def MostrarSaldo
    puts "Seu saldo é de R$#{@saldo}"
  end

  def ModificarTelefone(telefone)
    @telefone = telefone
    puts "Telefone modificado com sucesso"
  end

  def MostrarDadosPessoais
    puts "\nNome: #{@nome}\nCPF:#{@cpf}\nTelefone:#{@telefone}\nIdade:#{@idade}"
  end

  def MostrarDadosBancarios
    puts "Numero da conta: #{@numero_conta}\n Senha: #{@senha}"
  end
end

def Menu
  puts "Digite sua opcao:"
  puts "1. Depositar"
  puts "2. Sacar"
  puts "3. Exibir saldo"
  puts "4. Modificar telefone"
  puts "5. Exibir dados pessoais"
  puts "6. Exibir dados da conta"
  puts "7. Sair"
end

Menu()
selecao = gets.to_i
conta = BankAccount.new("Jonas de Souza", "048.233.976-23", "998324572", "19", "abc123")

while selecao != 7 do
  case selecao
  when 1
    puts "Quanto deseja depositar?"
    conta.Depositar(gets.to_f)
    puts " "
    Menu()
    selecao = gets.to_i
  when 2
    puts "Quanto deseja sacar?"
    conta.Sacar(gets.to_f)
    puts " "
    Menu()
    selecao = gets.to_i
  when 3
    conta.MostrarSaldo
    puts " "
    Menu()
    selecao = gets.to_i
  when 4
    puts "Qual seu novo telefone?"
    conta.ModificarTelefone(gets.chomp)
    puts " "
    Menu()
    selecao = gets.to_i
  when 5
    conta.MostrarDadosPessoais
    puts " "
    Menu()
    selecao = gets.to_i
  when 6
    conta.MostrarDadosBancarios
    puts " "
    Menu()
    selecao = gets.to_i
end
end