module Api
  module V1
    class UsersController < ApplicationController
      before_filter :find_user, only: [:show, :update, :alert_infection, :trade]
      before_filter :find_offering_user, only: [:trade]

      def index
        users = User.all.order(:id)
        render json: users, each_serializer: Api::V1::UserSerializer
      end

      def create
        @user = User.new user_params
        if @user.save
          render json: @user, status: :created, each_serializer: Api::V1::UserSerializer
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @user
      end

      def update
        if @user.update user_params
          render json: @user, status: :ok, each_serializer: Api::V1::UserSerializer
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def find_user
        @user = User.find params[:id]
      end

      def find_offering_user
        @offering_user = User.find params[:trade_offering][:id]
      end

      def user_params
        params.require(:user).permit :name, :age, :gender, :lat, :long
      end

      def required_params
        params.require(:trade_required).permit :items
      end
    end
  end
end
