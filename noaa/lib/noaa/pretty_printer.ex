defmodule NOAA.PrettyPrinter do
  def print(parsed_document) do
    params = find_parameters(parsed_document)
    weather = String.downcase(to_string(params.weather))
    IO.puts """
      At #{params.location}, the current weather is #{weather}.
      The tempurature is #{params.temp_c} degrees C.
      The visibility is #{params.visibility_mi} miles.
    """
  end

  defp find_parameters(parsed_document) do
    %{
      location: find(parsed_document, 'location'),
      weather: find(parsed_document, 'weather'),
      temp_c: find(parsed_document, 'temp_c'),
      visibility_mi: find(parsed_document, 'visibility_mi'),
    }
  end

  defp find(parsed_document, key) do
    xpath = '/current_observation/' ++ key
    [element] = :xmerl_xpath.string(xpath, parsed_document)
    [xml_text] = elem(element, 8)
    elem(xml_text, 4)
  end
end
