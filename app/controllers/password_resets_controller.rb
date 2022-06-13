class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email].downcase)
        if @user.present?
            #send email
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        flash[:notice] = "If there is an account associated with #{params[:email]}, you will receive an email with instructions on how to reset your password in a few minutes."
        redirect_to password_reset_url
    end

    def edit
        @user = User.find_signed(params[:token], purpose: "password_reset")
        if @user.blank?
            flash[:alert] = "Invalid or expired password reset token."
            redirect_to signin_url
        end

    end

    def update
        @user = User.find_signed(params[:token], purpose: "password_reset")
        if @user.update(user_params)
            flash[:notice] = "Password has been reset."
            redirect_to signin_url
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:password, :password_confirmation)
    end


end