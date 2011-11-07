class SuggestionsController < ApplicationController
  #respond_to :html, :js
  def index
    @suggestions = Suggestions.all.paginate(:page=>1)
  end

  def new

    @suggestion = Suggestion.new
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

    if @suggestion.save

    end

  end

  def update

  end

  def show
    @suggestion = Suggestion.find(params[:id])

  end


end
