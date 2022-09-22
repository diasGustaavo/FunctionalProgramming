defmodule Ex1 do
  @moduledoc """
  Exercicio 1 da disciplina LPIII - Programacao Funcional
  """

  ### Parte 1 - Algumas funcoes simples

  # Escreva o corpo das funcoes abaixo, seguindo o comportamento
  # especificado pela documentacao.

  @doc "Multiplica o numero passado como parametro por 5."
  def mult5(x) do
    x * 5
  end

  @doc "Calcula o quadrado do numero x"
  def quadrado(x) do
    x * x
  end

  @doc "Calcula a soma dos quadrados de x e y: x ao quadrado + y ao quadrado."
  def soma_quadrados(x, y) do
    quadrado(x) + quadrado(y)
  end

  @doc "Concatena as duas strings a e b."
  def concat(a, b) do
    "#{a}#{b}"
  end

  @doc "Efetua a negacao logica (NOT) do booleano a."
  def negacao(a) do
    !a
  end

  @doc "Efetua o E-logico (AND) dos dois booleanos a e b."
  def e_logico(a, b) do
    a && b
  end

  ### Parte 2 - Funcoes recursivas com condicao de parada simples

  # Para as funcoes a seguir, em geral basta verificar a estrutura de
  # um numero usado como parametro, sendo o caso base quando o numero for
  # zero.

  @doc "Multiplica os numeros a e b usando apenas soma repetida (a >= 0, b >= 0)."
  def mult(a, b) do
    cond do
      a == 0 || b == 0 ->
        0
      a >= b ->
        a + mult(a, b - 1)
      a < b ->
        b + mult(a - 1, b)
    end
  end

  @doc "Eleva o numero n `a potencia m, usando multiplicacao repetida (n >= 0, m >= 0)."
  def exp(n, m) do
    cond do
      m > 2 ->
        mult(n, exp(n, m-1))
      m == 2 ->
        mult(n, n)
      m == 1 ->
        n
      m == 0 ->
        1
    end
  end

  @doc "Concatena a string s com si mesma n vezes, n >= 0"
  def replica(s, n) do
    cond do
      n == 0 ->
        ""
      n == 1 ->
        s
      n > 1 ->
        replica("#{s}", n-1)
    end
  end

  @doc "Determina se o numero n (n >= 0) e' par, usando apenas subtracao"
  def numero_par(n) do
    cond do
      n == 0 ->
        true
      n == 1 ->
        false
      n >= 2 ->
        numero_par(n-2)
    end
  end

  @doc "Determina se o numero n (n >= 0) e' impar, usando apenas subtracao"
  def numero_impar(n) do
    cond do
      n == 0 ->
        false
      n == 1 ->
        true
      n >= 2 ->
        numero_impar(n - 2)
    end
  end

  # Bonus: tente definir numero_par usando numero_impar, e vice-versa


  ### Parte 3 - Funcoes recursivas com outras condicoes de parada

  # Nas funcoes a seguir a condicao de parada para a recursao nao e'
  # simplesmente verificar se um numero e' zero. A condicao de parada
  # deve ser pensada com cuidado

  @doc "Calcula a divisao inteira de a por b (a > 0 e b > 0), usando apenas subtracao"
  def divide(a, b) do
    cond do
      a < b ->
        0
      a == b ->
        1
      a * 2 >= b ->
        1 + divide(a - b, b)
    end
  end

  def aux(n, m) do
    cond do
      exp(2, m) <= n ->
        aux(n, m+1)
      exp(2, m) > n ->
        aux(n, m)
    end
  end

  @doc "Calcula qual e' a menor potencia de 2 maior ou igual a n (n > 0)."
  def teto_pot2(n) do
    aux(n, 1)
  end

  # Dica: crie uma funcao auxiliar de dois parametros, o primeiro e' o mesmo n
  # de teto_pot2, o outro e' uma potencia de dois (comecando com valor 1). Pense
  # na condicao de parada e na chamada recursiva; retorne o primeiro valor do
  # segundo parametro que e' maior que n. Use a funcao auxiliar para implementar
  # teto_pot2.

end
