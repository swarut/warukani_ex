defmodule WarukaniEx do

  @base_url "https://api.wanikani.com/v2/"

  def get(url) do
    url = "#{@base_url}#{url}"
    headers = ["Authorization": "Bearer #{api_token()}"]
    {:ok, response} = HTTPoison.get(url, headers)
    IO.puts(inspect(response))
    response
  end

  # def post(url, data) do
  #   url = "#{@base_url}#{url}"
  #   headers = ["Authorization": "Bearer #{api_token()}"]
  #   {:ok, response} = HTTPoison.get(url, headers)
  #   IO.puts(inspect(response))
  #   response
  # end

  def api_token do
    Application.fetch_env!(:warukani_ex, :api_token)
  end

  def list_review(data) do
    url = construct_url("reviews", data)
    response = get(url)
    Poison.decode!(response.body)
  end

  def list_subject(data) do
    url = construct_url("subjects", data)
    response = get(url)
    Poison.decode!(response.body)
  end

  def construct_url(url, data) do
    params = data
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")
    "#{url}?#{params}"
  end
end
