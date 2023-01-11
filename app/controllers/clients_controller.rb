class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def create
        client = Client.create!(client_params)
        # if client.is_admin=="t"
        #     session[:admin_id] = client.id
        #     render json: client, status: :created
        # else
        # session[:client_id] = client.id
        # render json: client, status: :created
        # end
        session[:client_id] = client.id
        render json: client, status: :created
    end

    def show
        client = find_client
        render json: client, status: :ok
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: :created
    end

    def destroy
        client = find_client
        client.destroy
        render json: {}, status: :no_content
    end

    private 

    def find_client
        client.find(params[:id])
    end

    def client_params
        params.permit(:client_name, :client_image, :email, :bought_tickets, :is_admin, :password, :password_confirmation)
    end

    def render_response_not_found
        render json: {errors: ["client not found!"]}, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
