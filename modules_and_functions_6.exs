defmodule Chop do
  def guess(actual, bottom..top) do
    guess(actual, current_guess(bottom, top), bottom..top)
  end

  def current_guess(bottom, top) do
    current_guess = div(top - bottom, 2) + bottom
    IO.puts("Is it #{current_guess}?")
    current_guess
  end

  def guess(actual, actual, _) do
    IO.puts(actual)
  end
  def guess(actual, current_guess, _bottom..top) when current_guess < actual do
    guess(actual, current_guess(current_guess, top), current_guess..top)
  end
  def guess(actual, current_guess, bottom.._top) when current_guess > actual do
    guess(actual, current_guess(bottom, current_guess), bottom..current_guess)
  end
end
