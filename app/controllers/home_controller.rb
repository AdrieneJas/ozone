class HomeController < ApplicationController
  def index
      require 'net/http'
      require 'json'

    @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=10&API_KEY=C51870B1-64E2-47DB-A8D8-DCFAE583AA91"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)

       if @output.empty?
      @final_output = "Error"
       elsif !@output
      @final_output = "Error"
       else
      @final_output = @output[0]['AQI']
       end

    if @final_output == "Error"
      @api_color = 'gray'
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Good (0-50) Air quality is very good."
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "Moderate 51-100"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Unhealthy for Sensitive Groups (USG) 101-150"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Unhealthy 151-200"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Very Unhealthy 201-300"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = "Hazardous 301-500"
    end
  end


  def zipcode
    @zip_query = params[:zipcode]

    if params[:zipcode] == ""
      @zip_query = "Hey you forgot to enter a zipcode!"
      elsif params[:zipcode]




      require 'net/http'
      require 'json'

@url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{@zip_query}&distance=10&API_KEY=C51870B1-64E2-47DB-A8D8-DCFAE583AA91"

      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)

       if @output.empty?
      @final_output = "Error"
       elsif !@output
      @final_output = "Error"
       else
      @final_output = @output[0]['AQI']
       end

    if @final_output == "Error"
      @api_color = "gray"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Good (0-50) Air quality is very good."
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "Moderate 51-100"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Unhealthy for Sensitive Groups (USG) 101-150"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Unhealthy 151-200"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Very Unhealthy 201-300"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = "Hazardous 301-500"
    end

    end
  end


end
