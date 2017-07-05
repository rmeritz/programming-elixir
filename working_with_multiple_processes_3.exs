defmodule Link do
  import :timer, only: [sleep: 1]

  def sad_function(parent) do
    send(parent, "I'm so sad :(")
    exit(:boom)
  end

  def run do
    spawn_link(Link, :sad_function, [self()])
    sleep(500)
    receive do
      msg ->
        IO.puts "MSG RECIEVED #{msg}"
    end
  end
end

Link.run
