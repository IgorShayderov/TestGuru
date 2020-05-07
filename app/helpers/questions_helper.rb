module QuestionsHelper
  def question_header(question)

    header_part = question.new_record? ?
    I18n.t('.create_new') :
    I18n.t('.edit_action')

    "#{header_part} #{t('question')} #{question.test.title}"
  end
end
