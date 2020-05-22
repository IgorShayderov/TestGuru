document.addEventListener('turbolinks:load', function (e) {
  const timer = document.querySelector('.timer');

  if (timer) {
    const avaliableTime = timer.dataset.time;

    new Timer(1, timer).startTimer();
  }
});

class Timer {
  constructor(time, timerNode) {
    // переводим время из минут в секунды
    this.time = time * 60;
    this.timerNode = timerNode;
  }

  startTimer() {
    const minute = 60;
    let timeLeft = this.time;

    const timer = setInterval(() => {
      timeLeft -= 1;
      this.renderTime(timeLeft);

      if (timeLeft === 0) {
        clearInterval(timer);
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
