class RegistrationController < ApplicationController
  skip_before_action :authenticate_request, only: :register

  def register
    command = RegisterUser.call(params[:email], params[:password])
    if command.success?
      render json: { message: 'Successfully created user' }, status: :created
    else
      render json: { error: command.errors }, status: :unprocessable_entity
    end
  end
end
