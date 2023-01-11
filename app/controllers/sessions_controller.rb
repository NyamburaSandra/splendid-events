class SessionsController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: :create

    def create
        client = Client.find(client_name: params[:client_name])
        if client&.authenticate(params[:password])
            session[:client_id] = client.id
            render json: client, status: :created
        else
            render json: {errors: ["Invalid username or password!"]}, status: :unauthorized
        end
    end

    def destroy
        session.delete :client_id
        return json: {}, status: :no_content
    end

    private

    def authorize
        return render json: {errors: ["Unauthorized access"]}, status: :unauthorized unless session.include? :client_id
    end

end
