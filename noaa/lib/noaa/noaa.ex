defmodule NOAA.NOAA do
  def fetch(location) do
    current_weather_url(location)
    |> HTTPoison.get
    |> handle_response
  end

  @noaa_base_url Application.get_env(:noaa, :noaa_base_url)

  def current_weather_url(location) do
    "#{@noaa_base_url}xml/current_obs/#{location}.xml"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, parse_xml(body)}
  end
  def handle_response(_) do
    {:error, "Could not fetch the current weather from NOAA"}
  end

  def parse_xml(body) do
    body
    |> :binary.bin_to_list
    |> :xmerl_scan.string
    |> (fn ({ xml, _ }) -> xml end).()
  end
end
