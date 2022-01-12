class IdentificationController < ApplicationController
    def create
        require 'net/http'
        require "uri"

        url = 'https://westus.api.cognitive.microsoft.com/spid/v1.0/identify?identificationProfileIds=039c2b20-c0a3-4762-9ae6-9d54c8a46dae&shortAudio=true'

        uri = URI.parse(url);

        filename = File.read('app/ML_CONVERSATIONS_MONO_16/' + params[:file])

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request.content_type = 'application/octet-stream'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '1f376d589a0b48c2aca22968d4b7bd03'
        # Request body
        request.body = filename

        http.use_ssl = true

        response = http.request(request)

        render json: {location: response['Operation-Location']}       
    end

    def selectedProfile
        require 'net/http'
        require "uri"

        url = params[:url]

        uri = URI.parse(url)

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = '1f376d589a0b48c2aca22968d4b7bd03'

        http.use_ssl = true

        response = http.request(request)

        respond_to do |format|
            format.json  { render :json => response.body }      
        end
    end
end