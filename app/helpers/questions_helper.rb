module QuestionsHelper
  def question_header(question)

    header_part = question.new_record? ?
    "Create new" :
    "Edit"

    "#{header_part} #{question.test.title} Question"
  end
end
