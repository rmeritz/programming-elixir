defmodule BracketValidator do
  def valid(str) do
    IO.puts valid(str, "")
  end

  defp valid(<< "(", tail :: binary() >>, stack) do
    valid(tail, "(" <> stack)
  end
  defp valid(<< "[", tail :: binary() >>, stack) do
    valid(tail, "[" <> stack)
  end
  defp valid(<< ")", tail :: binary() >>, << "(", stack :: binary() >>) do
    valid(tail, stack)
  end
  defp valid(<< "]", tail :: binary() >>, << "[", stack :: binary() >>) do
    valid(tail, stack)
  end
  defp valid(<< _, tail :: binary()>>, stack) do
    valid(tail, stack)
  end
  defp valid("", "") do
    true
  end
  defp valid("", _stack) do
    false
  end
end

BracketValidator.valid("") # true
BracketValidator.valid("()") # true
BracketValidator.valid("()[]") # true
BracketValidator.valid("[()()([hello])]") # true
BracketValidator.valid("(((") # false
BracketValidator.valid(")(") # false
BracketValidator.valid("(]") # false
BracketValidator.valid("[hello))") # false
