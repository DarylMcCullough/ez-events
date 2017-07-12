 class API::EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_access_control_headers
    
    def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Content-Type'
    end
 
    def create
        url = request.env["HTTP_ORIGIN"]
        puts "receiving create request from: #{url}"
        registered_application = RegisteredApplication.find_by(url: url)
        if ! registered_application
            puts "oh, dear!"
            render json: "Unregistered application", status: :unprocessable_entity
        else
            params = event_params
            @event = Event.new(params)
            @event.registered_application = registered_application
            if @event.save
                puts "Yay!"
                render json: @event, status: :created
            else
                puts "Oh, dear, again!"
                render json: {errors: @event.errors}, status: :unprocessable_entity
            end
        end
    end
    
    def preflight
        head 200
    end

    private
    
    def event_params
        params.require(:event).permit(:name)
    end
 end