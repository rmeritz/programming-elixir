defmodule NOAA.PrettyPrinter do
  def print(parsed_document) do
    params = find_parameters(parsed_document)
    IO.puts """
      At #{params.location}, the current weather is #{params.weather}.
      The tempature is #{params.tempature_string}.
      The visibility is #{params.visibility_mi} miles.
    """
  end

  defp find_parameters(parsed_document) do
    %{
      location: find(parsed_document, 'location'),
      weather: find(parsed_document, 'weather'),
      tempature_string: find(parsed_document, 'tempature_string'),
      visibility_mi: find(parsed_document, 'visibility_mi'),
    }
  end

  defp find(parsed_document, key) do
    xpath = '/current_observation/' ++ key
    IO.inspect parsed_document
    IO.inspect xpath
    IO.inspect :xmerl_xpath.string(xpath, parsed_document)
    [element] = :xmerl_xpath.string(xpath, parsed_document)
    [xml_text] = elem(element, 8)
    elem(xml_text, 4)
  end
end
