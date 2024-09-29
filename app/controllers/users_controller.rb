class UsersController < ApplicationController
    # Deshabilitar la verificación de autenticidad para este controlador (o al menos para la acción create)
    skip_before_action :verify_authenticity_token, only: [:create]
  
    def create
      user = User.new(user_params)
      
      if user.save
        render json: { message: 'User created successfully', user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :birthdate, :phone, :country)
    end
  end
  