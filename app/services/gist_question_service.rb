# frozen_string_literal: true

class GistQuestionService
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ACCESS_TOKEN) || client
  end

  def call
    Result.new(@client.create_gist(gist_params))
  end

  private

  def default_client
    GitHubClient.new
  end

  def gist_params
    {
      description: I18n.t('.description', title: @test.title),
      public: false,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  Result = Struct.new(:data) do
    def success?
      data.key?(:id)
    end
  end
end
