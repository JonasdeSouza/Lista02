class BankAccount
  def initialize(nome, cpf, telefone, idade, senha)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
    @senha = senha
    @numero_conta = rand(999..9999)
    @saldo = 0.00

    puts " Conta criada com sucesso"
  end

  def Depositar(quantia)
    @saldo += quantia
    puts " Dinheiro depositado, seu saldo agora é de R$#{@saldo}"
  end

  def Sacar(quantia)
    @saldo -= quantia
    puts " Dinheiro sacado, seu saldo agora é de R$#{@saldo}"
  end

  def MostrarSaldo
    puts " Seu saldo é de R$#{@saldo}"
  end

  def ModificarTelefone(telefone)
    @telefone = telefone
    puts " Telefone modificado com sucesso"
  end

  def MostrarDadosPessoais
    puts " Nome: #{@nome}\n CPF:#{@cpf}\n Telefone:#{@telefone}\n Idade:#{@idade}"
  end

  def MostrarDadosBancarios
    puts " Numero da conta: #{@numero_conta}\n Senha: #{@senha}"
  end
end

puts "Criando conta"
conta = BankAccount.new("Jonas de Souza", "048.233.976-23", "998324572", "19", "abc123")
puts "Depositando dinheiro"
conta.Depositar(100)
puts "Sacando dinheiro"
conta.Sacar(50)
puts "Mostrando Saldo"
conta.MostrarSaldo
puts "Modificando telefone"
conta.ModificarTelefone(61998137455)
puts "Mostrando dados pessoais"
conta.MostrarDadosPessoais
puts "Mostrando dados bancarios"
conta.MostrarDadosBancarios