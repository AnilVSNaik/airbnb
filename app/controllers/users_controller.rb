class UsersController < Clearance::UsersController

    def new
    @user = user_from_params
    render template: "users/new"
      end

    def create
        @user = user_from_params
      respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome email after save
            WelcomeJob.perform_now(current_user)
     
            format.html { redirect_to root_path notice: 'User was successfully created.' }
            format.json { render json: @user, status: :created, location: @user }
        else
            format.html { render action: 'new' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      def edit
        @user = current_user
      end

    def update
          @user = current_user
          if @user.update(permit_params)
              redirect_to root_path notice: 'Your details have been changed'
          else
              render 'edit'
          end
      end

     def user_from_params
        email = user_params.delete(:email)
        password = user_params.delete(:password)
        first_name = user_params.delete(:first_name)
        last_name = user_params.delete(:last_name)
        birthday = user_params.delete(:birthday)
        phone = user_params.delete(:phone)
        country = user_params.delete(:country)
        gender = user_params.delete(:gender)
        avatar = user_params.delete(:avatar)

        Clearance.configuration.user_model.new(user_params).tap do |user|
          user.email = email
          user.password = password
          user.first_name = first_name
          user.last_name = last_name
          user.birthday = birthday
          user.phone = phone
          user.country = country
          user.gender = gender
          user.avatar = avatar
        end
     end

     def user_params
           params[Clearance.configuration.user_parameter] || Hash.new
      end

      def permit_params
          params.require(:user).permit(:first_name,:last_name,:email,:password,:birthday,:phone,:country,:gender,:avatar)
      end
end