# calculate('127 + 27') #=> 150

defmodule Calculator do
  def calculate(char_list) do
    {number_1, rest_0} = find_number(char_list, '')
    {operant, rest_1} = find_operatant(rest_0)
    {number_2, ''} = find_number(rest_1, '')
    calculate(operant, number_1, number_2)
  end

  def find_number([digit | tail], number) when digit in '0123456789' do
    find_number(tail, number ++ [digit])
  end
  def find_number('', number) do
    {:erlang.list_to_integer(number),  ''}
  end
  def find_number([ ?\s | tail], number) do
    {:erlang.list_to_integer(number), tail}
  end

  def find_operatant([operant | [ ?\s | tail]]) when operant in '+-/*' do
    {operant, tail}
  end

  def calculate(?+, number_1, number_2) do
    number_1 + number_2
  end
  def calculate(?-, number_1, number_2) do
    number_1 - number_2
  end
  def calculate(?*, number_1, number_2) do
    number_1 * number_2
  end
  def calculate(?/, number_1, number_2) do
    number_1 / number_2
  end
end
