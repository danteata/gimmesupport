class MembersController < ApplicationController

  def new

    @member = Member.new
  end

  def edit

    @member = Member.find(params[:id])
  end

  def update

    @member = Member.find(params[:id])

    params[:member][:user_name]= params[:member][:user_name].downcase.capitalize #change casing to lower case before save. 
    if @member.update_attributes(params[:member])
      flash[:success] = "Your details have been updated"
      redirect_to @member

    else
      @title = "Edit Member"
      render "edit"
    end

  end

  def create

    params[:member][:user_name]= params[:member][:user_name].downcase.capitalize#change casing to lower case before save. 
    @member = Member.new(params[:member])

    if @member.save
      flash[:success] = "Congratulations, you're now on the support community"
      redirect_to @member
    else

      flash[:error] = "Oops something went wrong"
      @title = "New Member"
      render "new"
    end

  end

  def show
    @member = Member.find(params[:id])
  end

end
