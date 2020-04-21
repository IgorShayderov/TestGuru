module QuestionsHelper
  def question_header(question)

    headers = {
      "edit" => "Edit",
      "new" => "Create new",
    }
    "#{headers[params[:action]]} #{question.test.title} Question"
  end
end
