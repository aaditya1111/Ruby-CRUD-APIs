class Api::V1::SignupsController < ApplicationController
	skip_before_action :authenticate, only: :create
	def create
		user = Signup.new(signup_params)

		if user.save!
			render json: {status: 'SUCCESS', message:"Signup successfull}", data:user}, status: :ok
		else
			render json: {status: 'ERROR', message:'Signup is not successfull', data:user.errors}, status: :unprocessable_entity
		end
	end

	private

	def signup_params
		params.permit(:email, :password)
	end
end

