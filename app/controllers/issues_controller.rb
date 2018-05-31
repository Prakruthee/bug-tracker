class IssuesController < ApplicationController

  before_filter :require_login
  def new
    @issue = Issue.new
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  def create
    @issue= Issue.new(issue_params)
    @issue.user_id = current_user.id

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
    relation = Issue.where("")
    # @issue = @issues.first
  end

  def show
   @issue = Issue.find(params[:id])
  end

  def edit
    @issue = Issue.find(params[:id])
    respond_to do |format|
      format.js{}
    end
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.valid?
      @issue.update(issue_params)
      redirect_to issues_path
    else
      render "edit"
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:issue_name, :issue_type, :comment, :description, :status)
  end
end
