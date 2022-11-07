defmodule Ex4 do

  # Recursao de cauda e acumuladores

  # Aqui esta a versao recursiva normal que vimos para a funcao soma

  @doc "Soma os numeros a e b."
  def soma_rec(a, 0), do: a
  def soma_rec(a, b), do: 1 + soma_rec(a, b - 1)

  # Esta funcao nao apresenta recursividade de cauda, pois precisa somar
  # 1 ao resultado da chamada recursiva.

  # Escreva uma funcao similar de soma que tenha recursividade de cauda.
  # Use um parametro acumulador para evitar a soma apos a chamada recursiva.

  # Voce pode criar uma funcao auxiliar privada com o parametro acumulador,
  # ou fazer de outra forma.

  # negativos
  def soma_aux(a, b, acc) when b == 0 and a < 0, do: soma_aux(a+1, 0, acc-1)
  def soma_aux(a, b, acc) when a == 0 and b < 0, do: soma_aux(0, b+1, acc-1)
  def soma_aux(a, b, acc) when a < 0 and b < 0, do: soma_aux(a, b+1, acc-1)
  # caso de parada
  def soma_aux(a, b, acc) when a == 0 and b == 0, do: acc
  # positivos
  def soma_aux(a, b, acc) when b == 0, do: soma_aux(a-1, 0, acc+1)
  def soma_aux(a, b, acc) when a == 0, do: soma_aux(0, b-1, acc+1)
  def soma_aux(a, b, acc), do: soma_aux(a, b-1, acc+1)

  def soma(a, b), do: soma_aux(a, b, 0)


  # Escreva as funcoes a seguir usando recursividade de cauda. Se precisar,
  # crie funcoes auxiliares que usam um parametro acumulador.

  # Obs: os testes nao vao testar se as funcoes apresentam recursividade
  # de cauda ou nao, apenas se o objetivo da funcao e' cumprido.


  @doc "Multiplica os numeros a e b (b >= 0), usando apenas somas."
  def mult_aux(a, b, acc) when b == 0, do: acc
  def mult_aux(a, b, acc), do: mult_aux(a, b-1, acc + a)
  def mult(a, b), do: mult_aux(a, b, 0)

  @doc "Obtem o tamanho da lista l."
  def tamanho_aux([], acc), do: acc
  def tamanho_aux([head | tail], acc), do: tamanho_aux(tail, acc + 1)
  def tamanho(l), do: tamanho_aux(l, 0)

  @doc """
  Replica a string s, n vezes.

  Exemplo:
  iex> Ex4.replica("ruby", 4)
  "rubyrubyrubyruby"
  """
  def replica_aux(s, n, acc) when n < 1, do: acc
  def replica_aux(s, n, acc), do: replica_aux(s, n-1, "#{acc}#{s}")
  def replica(s, n) when n == 0, do: ""
  def replica(s, n) when n == 1, do: s
  def replica(s, n), do: replica_aux(s, n, "")

  @doc """
  Aplica a funcao f em cada elemento da lista l, retornando uma nova lista
  com os elementos transformados.

  Exemplo:
  iex> Ex4.map([1, 2, 3], fn x -> x * 2 end)
  [2, 4, 6]
  """
  def map_aux([], f, acc), do: acc
  def map_aux([head | tail], f, acc), do: map_aux(tail, f, acc ++ [f.(head)])
  def map(l, f), do: map_aux(l, f, [])

  @doc "Calcula a soma dos numeros da lista l."
  def soma_lista_aux([], acc), do: acc
  def soma_lista_aux([head | tail], acc), do: soma_lista_aux(tail, acc + head)
  def soma_lista(l), do: soma_lista_aux(l, 0)

  @doc "Calcula o produto dos numeros da lista l."
  def mult_lista_aux([], acc), do: acc
  def mult_lista_aux([head | tail], acc), do: mult_lista_aux(tail, acc * head)
  def mult_lista(l), do: mult_lista_aux(l, 1)

  @doc "Retorna uma string que e' a concatenacao de todas as strings na lista ls."
  def concat_lista_aux([], acc), do: acc
  def concat_lista_aux([head | tail], acc), do: concat_lista_aux(tail, "#{acc}#{head}")
  def concat_lista(ls), do: concat_lista_aux(ls, "")

  @doc """
  Retorna uma lista com os elementos da lista l para os quais o predicado p
  returna true.

  Exemplo:
  iex> Ex4.filter([10, 2, 15, 9, 42, 27], fn x -> x > 10 end)
  [15, 42, 27]
  """
  def filter_aux([], pred, acc), do: acc
  def filter_aux([x | r], pred, acc) do
    if pred.(x) do
      filter_aux(r, pred, acc ++ [x])
    else
      filter_aux(r, pred, acc)
    end
  end
  def filter(l, pred), do: filter_aux(l, pred, [])
  def filter([], _), do: []

end
