module TestPassagesHelper

  PERCENT_TO_PASS = 85

  def calc_success_percent(test_passsage)
    total = test_passsage.test.questions.count
    passed = test_passsage.correct_questions
    relation = passed.to_f / total.to_f

    (relation * 100).to_i
  end

  def test_passed?(test_passsage)
    success_percent = calc_success_percent(test_passsage)

    success_percent < PERCENT_TO_PASS ? false : true
  end
end
