class Person
  @@Costumer_id = 0

  def initialize(nome, cpf, telefone, idade)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
    @@Costumer_id += 1
  end

  attr_reader :nome, :cpf, :telefone, :idade

  def mostrardadospessoais()
    puts "Nome:#{@nome}"
    puts "CPF:#{@cpf}"
    puts "Telefone:#{@telefone}"
    puts "Idade:#{@idade}"
  end
end

class CurrentAccount < Person
  @@Costumer_id = 0
  @@contas = {}

  def initialize(nome, cpf, telefone, idade, senha)
    super(nome, cpf, telefone, idade)
    @numero_conta = rand(999..9999)
    @saldo = 0.00
    @senha = senha
    @@contas.store("#{@numero_conta}", @nome)
    @@Costumer_id += 1
  end

  attr_reader :saldo, :numero_conta

  def get_costumer_id
    @@Costumer_id
  end

  def printcontas
    @@contas
  end

  def sacar(valor)
    @saldo = @saldo - valor
    return {novo_saldo: @saldo, valor_sacado: valor}
  end

  def depositar(valor)
    @saldo = @saldo + valor
    return @saldo
  end

  def mostrarsaldo()
    puts "#{@saldo}"
    end

  def mostrardadosbancarios
    puts "Numero da conta:#{@numero_conta}"
    puts "Saldo da conta:#{@saldo}"
    puts "Costumer ID:#{@@Costumer_id}"
  end
end

class SavingAccount < Person
  @@contas = {}
  @@Costumer_id = 0

  def initialize(nome, cpf, telefone, idade, senha)
    super(nome, cpf, telefone, idade)
    @saldo = 0.0
    @numero_conta = rand(999..9999)
    @senha = senha
    @@Costumer_id += 1
    @@contas.store("#{@numero_conta}", @nome)
  end

  attr_reader :saldo, :numero_conta

  def get_costumer_id
    @@Costumer_id
  end

  def printcontas
    @@contas
  end

  def sacar(valor)
    @saldo = @saldo - valor
    return {novo_saldo: @saldo, valor_sacado: valor}
  end

  def depositar(valor)
    @saldo = @saldo + valor
    return @saldo
  end

  def mostrarsaldo()
    puts "#{@saldo}"
  end

  def mostrardadosbancarios
    puts "Numero da conta:#{@numero_conta}"
    puts "Saldo da conta:#{@saldo}"
    puts "Costumer ID:#{@@Costumer_id}"
  end
end

def MenuBanco
  puts "Digite sua opcao:"
  puts "1. Listar contas correntes"
  puts "2. Listar contas poupanca"
  puts "3. Criar conta corrente"
  puts "4. Criar conta poupanca"
  puts "5. Acessar conta"
  return gets.to_i
end

def MenuConta
  puts "Digite sua opcao:"
  puts "1. Depositar"
  puts "2. Sacar"
  puts "3. Exibir saldo"
  puts "4. Modificar telefone"
  puts "5. Exibir dados pessoais"
  puts "6. Exibir dados da conta"
  puts "7. Sair"
  return gets.to_i
end

contacorrente = CurrentAccount.new(nil, nil, nil, nil, nil)
contapoupanca = SavingAccount.new(nil, nil, nil, nil, nil)
cliente = Person.new(nil, nil, nil, nil)

loop do
  selecao = MenuBanco()
  case selecao
  when 1
    printcontasco = CurrentAccount.new(nil, nil, nil, nil, nil)
    if printcontasco.printcontas.size <= 1
      puts "Ainda não existem contas correntes, por favor crie uma"
    else printcontasco.printcontas.compact.each {|key, value| puts "Conta numero #{key}, pertencente a #{value}"}
    end
  when 2
    printcontaspo = SavingAccount.new(nil, nil, nil, nil, nil)
    if printcontaspo.printcontas.size <= 1
      puts "Ainda não existem contas poupanca, por favor crie uma"
    else printcontaspo.printcontas.compact.each {|key, value| puts "Conta numero #{key}, pertencente a #{value}"}
    end
  when 3
    puts "Digite seu nome:"
    nome = gets.chomp
    puts "Digite seu CPF"
    cpf = gets.chomp
    puts "Digite seu telefone"
    telefone = gets.chomp
    puts "Digite sua idade"
    idade = gets.chomp
    puts "Defina sua senha"
    senha = gets.chomp

    contacorrente = CurrentAccount.new(nome, cpf, telefone, idade, senha)
    cliente = Person.new(nome, cpf, telefone, idade)
  when 4
    puts "Digite seu nome:"
    nome = gets.chomp
    puts "Digite seu CPF"
    cpf = gets.chomp
    puts "Digite seu telefone"
    telefone = gets.chomp
    puts "Digite sua idade"
    idade = gets.chomp
    puts "Defina sua senha"
    senha = gets.chomp

    contapoupanca = SavingAccount.new(nome, cpf, telefone, idade, senha)
    cliente = Person.new(nome, cpf, telefone, idade)
  when 5
    puts "Digite o numero da conta a qual deseja se logar"
    printcontasco = CurrentAccount.new(nil, nil, nil, nil, nil)
    printcontaspo = SavingAccount.new(nil, nil, nil, nil, nil)
    contasco = printcontasco.printcontas.compact.map {|key, value| key}
    puts contasco
    contaspo = printcontaspo.printcontas.compact.map {|key, value| key}
    puts contaspo
    conta_numero = gets.chomp

    comparacao = contasco.select {|number| number == conta_numero}
    if comparacao.size > 0
      conta = 1
      else conta = 2
    end

    if conta == 1
      loop do
      opcao = MenuConta()
      case opcao
      when 1
        puts "Quanto deseja depositar?"
        resultado = contacorrente.depositar(gets.to_f)
        puts "Seu novo saldo e #{resultado}"
      when 2
        puts "Quanto deseja sacar?"
        contacorrente.sacar(gets.to_f)
        puts "Seu novo saldo e #{resultado}"
      when 3
        contacorrente.mostrarsaldo()
        puts " "
      when 4
        puts "Qual seu novo telefone?"
        cliente.modificar_telefone(gets.chomp)
        puts " "
      when 5
        cliente.mostrardadospessoais()
        puts " "
      when 6
        contacorrente.mostrardadosbancarios
        puts " "
      when 7
        break
    end
      end
      else loop do
        opcao = MenuConta()
        case opcao
        when 1
          puts "Quanto deseja depositar?"
          resultado = contapoupanca.depositar(gets.to_f)
          puts "Seu novo saldo e #{resultado}"
        when 2
          puts "Quanto deseja sacar?"
          resultado = contapoupanca.sacar(gets.to_f)
          puts "Seu novo saldo e #{resultado}"
        when 3
          contapoupanca.mostrarsaldo()
          puts " "
        when 4
          puts "Qual seu novo telefone?"
          cliente.modificar_telefone(gets.chomp)
          puts " "
        when 5
          cliente.mostrardadospessoais()
          puts " "
        when 6
          contapoupanca.mostrardadosbancarios
          puts " "
        when 7
          break
    end
  end
    end
  end
end

