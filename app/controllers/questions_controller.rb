class QuestionsController < ApplicationController

  def new
    @question = Question.new

  end

  def create

    #@member = Member.find(params[:question][:member_id]) #finds the community member who posted the question 
    @community = Community.find(params[:question][:community_id]) #finds the community where the question was posted 

    @question = @community.questions.create!(:member_id => params[:question][:member_id], :content=>
                       params[:question][:content], :title => params[:question][:title])
    if @question.save
      flash[:success] = "Question submitted successfully"
      redirect_to @community
    else
      flash[:notice] = "Oops...unable to post question at this time."
      @title = "Create Question"
      render "new"
    end

  end

  def edit
    @question = Question.find(params[:id])

    if @question.save

    end

  end

  def update

  end

  def show
    @question = Question.find(params[:id])

  end

end
