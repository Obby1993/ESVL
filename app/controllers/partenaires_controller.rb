class PartenairesController < ApplicationController

  def new
    @partenaire = Partenaire.new
  end

  def create
    @partenaire = Partenaire.new(partenaire_params)
    if @partenaire.save!
      flash.alert = "Vous venez d'ajouter un nouveau partenaire."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @partenaire = Partenaire.find(params[:id])
  end

  def update
    @partenaire = Partenaire.find(params[:id])
    @partenaire.update(partenaire_params)
    redirect_to root_path
  end



  def destroy
    @partenaire = Partenaire.find(params[:id].to_i)
    @partenaire.destroy
    redirect_to root_path, status: :see_other
  end


  private

  def partenaire_params
    params.require(:partenaire).permit(:année, :entreprise, :contact, :numero, :email, :photo)
  end
end
