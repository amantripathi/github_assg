class GithubService

  def initialize(options={})
    @user_name = options[:user_name]
    @repo_name = options[:repo_name] if options[:repo_name]
  end

  def list_repo
    begin
      response = RestClient.get "https://api.github.com/users/#{@user_name}/repos"
      json_parse(response)
    rescue Exception => e
      []
    end
  end

  def repo_commits
    begin
      response = RestClient.get "https://api.github.com/repos/#{@user_name}/#{@repo_name}/commits"
       json_parse(response)
    rescue Exception => e
      []
    end
  end

  def json_parse(response)
    JSON.parse(response)
  end
end