require 'bcrypt'

class TopController < ApplicationController

    
    def main
        if session[:login_uid]
            render 'main'
        else
            render 'login'
        end
    end
    
    def login
        user_pass = BCrypt::Password.create("bbb")
        if BCrypt::Password.new(user_pass) == params[:pass]
            render 'main'
        else
            render 'error'
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end

end