def show
  @esvl = EsvlTeam.find(params[:id])
end

def new
  @esvl = EsvlTeam.new
end

def create
  @esvl = EsvlTeam.new(esvl_team_params)
  if @esvl.save!
    redirect_to esvl_team_path(@esvl)
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
  @esvl = EsvlTeam.find(params[:id])
end

def update
  @esvl = EsvlTeam.find(params[:id])
  @esvl.update(esvl_team_params)
  redirect_to esvl_team_path(@esvl)
end

def destroy
  @esvl = EsvlTeam.find(params[:id])
  @esvl.destroy
  redirect_to esvl_teams_path(), status: :see_other
end

private

def esvl_team_params
  params.require(:esvl_team).permit(:année, :division, :genre, :coach, :résultat, :joueurs, :autre, photos: [])
end
