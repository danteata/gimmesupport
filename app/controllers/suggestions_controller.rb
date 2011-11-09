class SuggestionsController < ApplicationController
  #respond_to :html, :js
  def index
    @community = Community.find(params[:community_id])
    @suggestions= @community.suggestions
  end

  def new
    @community = Community.find(params[:community_id])
    @qsuggestion = @community.suggestions.build

  end

  def create

    #@member = Member.find(params[:suggestion][:member_id]) #finds the community member who posted the suggestion 
    @community = Community.find(params[:suggestion][:community_id]) #finds the community where the suggestion was posted 

    @suggestion = @community.suggestions.create!(:member_id => params[:suggestion][:member_id], :content=>
                       params[:suggestion][:content], :title => params[:suggestion][:title])
    if @suggestion.save
      flash[:success] = "Suggestion submitted successfully"

      respond_to do |format|
        format.html {redirect_to @community}
        format.js
      end
      #redirect_to @community
    else
      flash[:notice] = "Oops...unable to post suggestion at this time."
      @title = "Create Suggestion"
      render "new"
    end

  end

  def edit
    @suggestion = Suggestion.find(params[:id])

  end

  def update

    @suggestion = Suggestion.find(params[:id])
    if @suggestion.update_attributes(:suggestion)
      flash[:notice] = "suggestion updated successfully"
      redirect_to community_path(@suggestion.community)
    else
      render "edit"
    end
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @community = @suggestion.community

  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy
    flash[:notice] = "successfully deleted suggestion"
    redirect_to community_path(@suggestion.community)
  end


end
