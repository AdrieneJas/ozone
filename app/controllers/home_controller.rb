class HomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    @final_output, @api_color, @api_description = fetch_data('89129')
  end

  def zipcode
    @zip_query = params[:zipcode]

    if @zip_query.empty?
      @zip_query = "Hey you forgot to enter a zipcode!"
    else
      @final_output, @api_color, @api_description = fetch_data(@zip_query)
    end
  end

  private

  def fetch_data(zip_code)
    url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{zip_code}&distance=10&API_KEY=C51870B1-64E2-47DB-A8D8-DCFAE583AA91"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    output = JSON.parse(response)

    final_output = "Error"
    api_color = 'gray'
    api_description = ""

    unless output.empty?
      final_output = output[0]['AQI']

      case final_output
      when 0..50
        api_color = "green"
        api_description = "Good (0-50) Air quality is very good."
      when 51..100
        api_color = "yellow"
        api_description = "Moderate 51-100"
      when 101..150
        api_color = "orange"
        api_description = "Unhealthy for Sensitive Groups (USG) 101-150"
      when 151..200
        api_color = "red"
        api_description = "Unhealthy 151-200"
      when 201..300
        api_color = "purple"
        api_description = "Very Unhealthy 201-300"
      else
        api_color = "maroon"
        api_description = "Hazardous 301-500"
      end
    end

    [final_output, api_color, api_description]
  end
end
