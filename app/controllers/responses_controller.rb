class ResponsesController < ApplicationController

  def create
    @respondable = find_respondable #the question or suggestion etc that is being responded to 
    #might be useful later
    #@comments = Comment.find(:all,
                                    #:joins => "forum_topics",
                                    #:conditions => ["forum_topics.featured = ? ", true] 
                                    #)
    @reponse = @respondable.responses.create!(:member_id => params[:response][:member_id], :content=> params[:response][:content])

    @community = Community.find(@respondable.community)

    if  !@response.nil? &&  @response.save
      flash[:success] = "Response submitted successfully"

      respond_to do |format|
        format.html {redirect_to @community}
        format.js
      end
      #redirect_to @community
    else
      flash[:notice] = "Oops...unable to post question at this time."
      @title = "Create Question"
      respond_to do |format|
        format.html {redirect_to @community}
        format.js
      end
    end

  end

  def destroy

    @response = response.find(params[:id])
    #the community where the respondable(question or suggestion was spoted)
    @community = Community.find(@response.respondable.community_id)

    @response.destroy

    respond_to do |format|
      format.html {redirect_to @community}
      format.js
    end

  end


  private

  def find_respondable
    params.each do |name, value|
      if !name.blank? &&  name =~ /(.+)_id$/ #loop throught the parameters and search for one with *_id 
        id_param = $1.classify.constantize.find(value)
        return respondable = id_param unless id_param.eql? "member_id" #the id parameter should not be member_id
      end
    end
    nil
  end


end
