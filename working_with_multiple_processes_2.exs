defmodule SpawnTokens do
  def display_token(parent, token) do
    send parent, {:ok, token}
  end
end

fred = spawn(SpawnTokens, :display_token, [self, "Fred"])
betty = spawn(SpawnTokens, :display_token, [self, "Betty"])


receive do
  {:ok, "Betty"} ->
    IO.puts "Got Betty"
end

receive do
 {:ok, "Fred"} ->
   IO.puts "Got Fred"
end
