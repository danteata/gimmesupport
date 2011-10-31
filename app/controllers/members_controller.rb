class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.create!(params[:id])
  end

  def show
    @member = Member.find(params[:id])
  end

end
