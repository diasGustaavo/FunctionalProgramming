import Integer

defmodule Ex2 do
  @moduledoc "Codigo para o Exercicio 2 de LPIII - Programacao Funcional"

  @doc "Retorna o terceiro elemento da lista l, ou nil caso l tenha menos de 3 elementos."
  def terceiro(l) do
    cond do
      length(l) < 3 ->
        nil
      length(l) >= 3 ->
        Enum.at(l, 2)
    end
  end

  @doc "Obtem o tamanho da lista l"
  def tamanho(l), do: length(l)

  # Um tipo comum de processamento de lista e' calcular um resultado levando
  # em consideracao todos os elementos da lista, por exemplo a soma ou
  # produto de uma lista de numeros.

  @doc "Calcula a soma dos numeros da lista l."
  def soma_lista(l) do
    cond do
      tamanho(l) == 0 ->
        0
      tamanho(l) >= 1 ->
        Enum.at(l, 0) + soma_lista(List.delete_at(l, 0))
    end
  end

  @doc "Calcula o produto dos numeros da lista l."
  def mult_lista(l) do
    cond do
      tamanho(l) == 0 ->
        1
      tamanho(l) >= 1 ->
        Enum.at(l, 0) * mult_lista(List.delete_at(l, 0))
    end
  end

  # Opcional: escreva uma versao de mult_lista que retorne zero assim que
  # encontrar um elemento 0 na lista, sem precisar ir ate' o fim da lista
  # e efetuar todas as multiplicacoes.

  @doc "Retorna uma string que e' a concatenacao de todas as strings na lista ls."
  def concat_lista(ls) do
    cond do
      tamanho(ls) == 0 ->
        ""
      tamanho(ls) == 1 ->
        "#{Enum.at(ls, 0)}"
      tamanho(ls) > 1 ->
        concat_lista(List.delete_at(List.replace_at(ls, 1, "#{Enum.at(ls, 0)}#{Enum.at(ls, 1)}"), 0))
    end
  end

  @doc "Retorna o maior numero em uma lista de numeros (nil se a lista for vazia)."
  def max_lista(l) do
    cond do
      tamanho(l) == 0 ->
        nil
      tamanho(l) == 1 ->
        Enum.at(l, 0)
      tamanho(l) > 1 ->
        cond do
          Enum.at(l, 0) > Enum.at(l, 1) ->
            max_lista(List.delete_at(l, 1))
          Enum.at(l, 0) <= Enum.at(l, 1) ->
            max_lista(List.delete_at(l, 0))
        end
    end
  end

  # As vezes podemos querer uma parte dos elementos da lista, sejam
  # os primeiros ou ultimos.

  @doc """
  Retorna os primeiros n elementos da lista l.
  Se l tem n elementos ou menos, retorna a lista inteira.

  Exemplo:
  iex> Ex2.primeiros_n([1, 2, 3, 4], 2)
  [1, 2]
  """
  def primeiros_n(l, n) do
    cond do
      tamanho(l) <= n ->
        l
      tamanho(l) > n ->
        primeiros_n(List.delete_at(l, (tamanho(l) - 1)), n)
    end
  end

  @doc """
  Retorna os ultimos n elementos da lista l.
  Se l tem n elementos ou menos, retorna a lista inteira.

  Exemplo:
  iex> Ex2.ultimos_n([1, 2, 3, 4], 2)
  [3, 4]
  """
  def ultimos_n(l, n) do
    cond do
      tamanho(l) <= n ->
        l
      tamanho(l) > n ->
        ultimos_n(List.delete_at(l, 0), n)
    end
  end
  # Em algumas situacoes, queremos transformar cada elemento de uma lista da
  # mesma forma, obtendo uma nova lista com os resultados.

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
  original, multiplicados por 2.

  Exemplo:
  iex> Ex2.dobro_lista([1, 2, 3, 4])
  [2, 4, 6, 8]
  """

  def dobro_lista(l) do
    cond do
      tamanho(l) == 0 ->
        []
      tamanho(l) >= 1 ->
        [Enum.at(l, 0)*2] ++ dobro_lista(List.delete_at(l, 0))
    end
  end

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
  original elevados ao quadrado.

  Exemplo:
  iex> Ex2.quadrado_lista([1, 2, 3, 4])
  [1.0, 4.0, 9.0, 16.0]
  """
  def quadrado_lista(l) do
    cond do
      tamanho(l) == 0 ->
        []
      tamanho(l) >= 1 ->
        [:math.pow(Enum.at(l, 0), 2)] ++ quadrado_lista(List.delete_at(l, 0))
    end
  end

  # Uma outra necessidade comum e' selecionar apenas os elementos de uma lista
  # que possuem alguma propriedade, por exemplo apenas os numeros positivos, ou
  # apenas as strings que comecam com uma letra maiuscula.

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros positivos
  da lista original.

  Exemplo:
  iex> Ex2.positivos_lista([-2, 2, 0, 88, 15, -11, 42])
  [2, 88, 15, 42]
  """
  def positivos_lista(l) do
    cond do
      tamanho(l) == 0 ->
        []
      tamanho(l) >= 1 ->
        cond do
          Enum.at(l, 0) > 0 ->
            [Enum.at(l, 0)] ++ positivos_lista(List.delete_at(l, 0))
          Enum.at(l, 0) <= 0 ->
            positivos_lista(List.delete_at(l, 0))
        end
    end
  end

  @doc "Retorna apenas os numeros pares de uma lista de numeros."
  def pares_lista(l) do
    Enum.filter(l, fn number -> rem(number, 2) == 0 end)
  end

  # Podemos querer fazer operacoes no agregado, combinando os elementos
  # de mesma posicao em duas listas, gerando uma terceira lista. Por exemplo,
  # somar as listas [1, 2, 3] e [4, 5, 6] elemento a elemento, resultando na
  # lista [5, 7, 9].

  @doc """
  Dadas duas listas de numeros, retorna uma lista com a soma de cada elemento
  de mesma posicao nas duas listas. Se uma das listas for menor que a outra,
  retorna uma lista do tamanho da menor.

  Exemplo:
  iex> Ex2.soma_listas([1, 2, 3], [7, 8, 9, 3])
  [8, 10, 12]
  """
  def soma_listas(l1, l2) do
    cond do
      tamanho(l1) == 0 || tamanho(l2) == 0 ->
        []
      tamanho(l1) >= 1 && tamanho(l2) >= 1 ->
        [Enum.at(l1, 0) + Enum.at(l2, 0)] ++ soma_listas(List.delete_at(l1, 0), List.delete_at(l2, 0))
    end
  end

  @doc """
  Dadas duas listas de strings l1 e l2, retorna uma lista em que cada elemento
  e' a concatenacao dos elementos de mesma posicao em l1 e l2.
  Se uma das listas for menor que a outra, retorna uma lista do tamanho da menor.

  Exemplo:
  iex> Ex2.concat_listas(["a", "b", "c"], ["x", "y", "z"])
  ["ax", "by", "cz"]
  """
  def concat_listas(l1, l2) do
    cond do
      tamanho(l1) == 0 || tamanho(l2) == 0 ->
        []
      tamanho(l1) >= 1 && tamanho(l2) >= 1 ->
        ["#{Enum.at(l1, 0)}#{Enum.at(l2, 0)}"] ++ concat_listas(List.delete_at(l1, 0), List.delete_at(l2, 0))
    end
  end

  # Algumas outras manipulacoes de listas.

  # Dica: para append, e' possivel resolver apenas fazendo recursao e seguindo
  # a estrutura de uma das listas e pensando qual deve ser a resposta quando essa
  # lista for vazia.

  @doc """
  Junta/concatena duas listas, retornando uma lista com todos os elementos da
  primeira seguidos pelos elementos da segunda.

  Exemplo:
  iex> Ex2.append([1, 2, 3], [4, 5, 6])
  [1, 2, 3, 4, 5, 6]
  """
  def append(l1, l2) do
    cond do
      tamanho(l1) == 0 && tamanho(l2) == 0 ->
        []
      tamanho(l1) > 0 ->
        [Enum.at(l1, 0)] ++ append(List.delete_at(l1, 0), l2)
      tamanho(l2) > 0 ->
        [Enum.at(l2, 0)] ++ append(l1, List.delete_at(l2, 0))
    end
  end


  # Dica: para a funcao a seguir, pode ser necessario definir uma funcao auxiliar.

  @doc """
  Retorna uma lista apenas com os elementos de posicao (indice) par na lista l.
  Considere o primeiro elemento como posicao 1 (e nao 0 como seria o indice).

  Exemplo:
  iex> Ex2.posicoes_pares([2, 4, 6, 8, 10])
  [4, 8]
  """
  def posicoes_pares(l) do
    cond do
      tamanho(l) <= 1 ->
        []
      tamanho(l) >= 2 ->
        [Enum.at(l, 1)] ++ posicoes_pares(List.delete_at(List.delete_at(l, 0), 0))
    end
  end

end
