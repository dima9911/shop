class UsersController < ApplicationController
	
def show
    @users = User.find(params[:id])

    render 
  end

    def alusers
    @users = User.all
    end

    def update

      user = User.find(params[:id].to_i)

      if user.admin
      stop_admine_mode user      
      else

      give_admine_mode user
      end
      redirect_to '/alusers'

    end

  def new
  	@user = User.new
  end

def create
    @user = User.new(user_params)
    if @user.save
    	 flash[:success] = "Thank for your registration! NOW, login!"
      redirect_to "/"
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation
                                  )
    end


  

end
