class PeopleController < ApplicationController
  def new
  	@people = Person.new
  end

  def create
  	@people = Person.new(people_params)
  	if @people.save
  	   flash[:notice] = "登録が完了しました"
  	   redirect_to people_path
  	 else
  	 	render "new"
  	 end
  end

  def index
  	@people = Person.all
  end

  def edit
  	@people = Person.find(params[:id])
  end

  def update
  	@people = Person.find(params[:id])
  	if  @people.update(people_params)
  		flash[:notice] = "登録が完了しました"
  		redirect_to people_path
  	else
  		render "edit"
  	end
  end

  def destroy
  	@people = Person.find(params[:id])
  	@people.destroy
  	redirect_to people_path
  end

  private
  def people_params
  	params.require(:person).permit(:person_name)
  end
end
