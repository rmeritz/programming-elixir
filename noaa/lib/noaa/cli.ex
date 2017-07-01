defmodule NOAA.CLI do
  @moduledoc """
  Handle the command line parsing and dispatch to the various functions that end
  up display the latest weather at a given location.
  """

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help which returns :help.

  Otherwise it is a location abberviation
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h:
      :help])
    case parse do
      { [help: true], _, _ } ->
        :help
      {_, [location], _} ->
        location
    end
  end

  def process(:help) do
    IO.puts "usage: noaa <location>"
  end
  def process(location) do
    NOAA.NOAA.fetch(location)
    |> decode_response
    |> NOAA.PrettyPrinter.print
  end

  def decode_response({:ok, body}), do: body
  def decode_response({:error, message}) do
    IO.puts message
    System.halt(2)
  end
end
