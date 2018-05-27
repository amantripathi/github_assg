class HomesController < ApplicationController
  skip_before_action :ensure_logged_in, only: :index
  def index
    if current_user
      redirect_to repo_list_path
    end
  end

  def repo_list
    options = {}
    options[:user_name] = @current_user.login
    obj = GithubService.new(options)
    @repo_list = obj.list_repo
  end

  def repo_commit
    options = {}
    options[:user_name] = @current_user.login
    options[:repo_name] = params[:repo_name]
    obj = GithubService.new(options)
    @commits = obj.repo_commits
  end
end
