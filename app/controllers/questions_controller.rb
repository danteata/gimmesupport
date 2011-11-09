class QuestionsController < ApplicationController

  #respond_to :html, :js
  def index
    @community = Community.find(params[:community_id])
    @questions = @community.questions
  end

  def new

    @community = Community.find(params[:community_id])
    @question = @community.questions.build
  end

  def create

    #@member = Member.find(params[:question][:member_id]) #finds the community member who posted the question 
    @community = Community.find(params[:question][:community_id]) #finds the community where the question was posted 

    @question = @community.questions.create!(:member_id => params[:question][:member_id], :content=>
                       params[:question][:content], :title => params[:question][:title])
    if @question.save
      flash[:success] = "Question submitted successfully"

      respond_to do |format|
        format.html {redirect_to @community}
        format.js
      end
      #redirect_to @community
    else
      flash[:notice] = "Oops...unable to post question at this time."
      @title = "Create Question"
      render "new"
    end

  end

  def edit
    @question = Question.find(params[:id])
    @community = @question.community

  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(:question)
      flash[:notice] = "question updated successfully"
      redirect_to community_path(@question.community)
    else
      render "edit"
    end

  end

  def show
    @question = Question.find(params[:id])
    @responses = @question.responses.paginate(:page => params[:page], :per_page => 5)
    @community = @question.community

  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "successfully deleted question"
    redirect_to community_path(@question.community)
  end

end
