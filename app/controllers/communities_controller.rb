class CommunitiesController < ApplicationController

  def new
    @community = Community.new

  end

  def create

    params[:community][:name]= params[:community][:name].downcase #change casing to lower case before save. 
    @community = Community.new(params[:community])
    if @community.save
      flash[:success] = "New Support Community Successfully created, #{@community.name}"
      redirect_to @community
    else
      flash[:error] = "Process unsuccessful"
      @title = "New community"
      render 'new'
    end

  end

  def show

    @community = Community.find(params[:id])
    @questions = @community.questions
    #@questions = @community.questions.blank?[] : @community.questions
    #@community = Community.find_by_name(params[:id]) #for displaying url with company name 
  end

  def edit
    @community = Community.find(params[:id])

  end

  def update

    @community = Community.find(params[:id])
    params[:community][:name]= params[:community][:name].downcase #change casing to lower case before save. 
    if @community.update_attributes(params[:community])
      flash[:success] = "Community updated successfully"
      redirect_to @community

    else
      flash[:notic] = "Oops something went wrong"
      @title = Edit Community
      render "edit"
    end
  end

  def chat

  end
  
  def find

    if params[:companyname]
     @community = Community.find_by_name(params[:companyname].downcase) 
     unless @community.nil?
       redirect_to @community
     else
       flash[:notice] = "Company not found"
       #redirect_to "index"
       render "index"
      end
    end
  end

end
