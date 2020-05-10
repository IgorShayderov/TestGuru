# frozen_string_literal: true

class GistQuestionService
  # ACCESS_TOKEN = '02c4bfbde8b58f9acc3b0dc4c6b3477ebfa74498'
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

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
end
