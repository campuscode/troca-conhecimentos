class ProfilesController < ApplicationController

 def new
   @profile = Profile.new
 end

 def create
   @profile = Profile.new(params_profile)
   @profile.user = current_user

   if @profile.save
     redirect_to root_path
     flash[:success] = 'Seu perfil está concluido, aproveite.'
   else
      flash[:error] = 'É necessario preencher todos os campos.'
      render :new
   end
 end


 private

 def params_profile
   params.require(:profile).permit(:name, :birth_date, :city, :state, :skills, :photo)
 end

end
