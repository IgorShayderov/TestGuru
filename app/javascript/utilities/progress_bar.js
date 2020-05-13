document.addEventListener('turbolinks:load', function (e) {
  const testProgress = document.querySelector('.test-progress');

  if (testProgress) {
    const progressBar = document.querySelector('.progress-bar');
    const currentQuestionIndex = testProgress.querySelector('.current-question-index').dataset.questionIndex;
    const maxQuestionCount = testProgress.querySelector('.max-question-index').dataset.questionMax;
    const completionPercent = currentQuestionIndex / maxQuestionCount * 100;

    progressBar.style.width = `${completionPercent}%`;
  }
});
