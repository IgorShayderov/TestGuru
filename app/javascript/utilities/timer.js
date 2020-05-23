document.addEventListener('turbolinks:load', function (e) {
  const timer = document.querySelector('.timer');

  if (timer) {
    const questionForm = document.querySelector('.question-form');
    const avaliableTime = Math.floor(timer.dataset.time);
    const testPassageId = timer.dataset.testPassage;

    new Promise ((resolve) => {
      new Timer(avaliableTime, timer, testPassageId).startTimer(resolve);
    }).then(() => {
      questionForm.submit();
    });
  }
});

class Timer {
  constructor(time, timerNode, testPassageId) {
    this.time = time;
    this.timerNode = timerNode;
    this.testPassageId = testPassageId;
  }

  startTimer(callback) {
    const minute = 60;
    let timeLeft = this.time;

    this.renderTime(timeLeft);

    if (this.timerNode.classList.contains('hide')) {
      this.timerNode.classList.remove('hide');
    }

    const timer = setInterval(() => {
      timeLeft -= 1;
      this.renderTime(timeLeft);

      if (timeLeft <= 0) {
        clearInterval(timer);

        callback();
      } else if (timeLeft < minute && !this.timerNode.classList.contains('low-time-left')) {
        this.timerNode.classList.add('low-time-left');
      }
    }, 1000);
  }

  formatTimeLeft(time) {
    const minutes = Math.floor(time / 60);
    let seconds = time % 60;

    if (seconds < 10) {
      seconds = `0${seconds}`;
    }

    return `${minutes}:${seconds}`;
  }

  renderTime(time) {
    this.timerNode.innerHTML = this.formatTimeLeft(time);
  }
}
