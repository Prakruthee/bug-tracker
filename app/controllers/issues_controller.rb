class IssuesController < ApplicationController

  def new
    @issue = Issue.new
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  def create
    @issue= Issue.new(issue_params)
    if @issue.valid? && @issue.errors.blank?
      @issue.save
      redirect_to issues_path
    else
      respond_to do |format|
        format.html { render action: "new" }
      end
    end
  end

  def index
  end

  private

  def issue_params
    params.require(:issue).permit(:issue_name, :issue_type, :comment, :description, :status)
  end


end
