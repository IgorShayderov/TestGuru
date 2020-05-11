document.addEventListener('turbolinks:load', function (e) {
  const control = document.querySelector('.sort-by-title');

  if (control) {
    control.addEventListener('click', sortRowsByTitle);
  }
});

function sortRowsByTitle() {
  const table = document.querySelector('#tests-table');
  const tbody = table.querySelector('tbody');
  const rows = tbody.querySelectorAll('tr');
  const sortedTbody = document.createElement('tbody');
  const arrowUp = this.querySelector('.octicon-arrow-up')
  const arrowDown = this.querySelector('.octicon-arrow-down');

  const compareRowsAsc = (nextRow, currentRow) => {
    const currentRowTitle = currentRow.querySelector('.test-title').textContent;
    const nextRowTitle = nextRow.querySelector('.test-title').textContent;

    if (nextRowTitle < currentRowTitle) {
      return -1;
    } else if (nextRowTitle > currentRowTitle) {
      return 1;
    } else {
      return 0;
    }
  };
  const compareRowsDesc = (nextRow, currentRow) => {
    const currentRowTitle = currentRow.querySelector('.test-title').textContent;
    const nextRowTitle = nextRow.querySelector('.test-title').textContent;

    if (nextRowTitle > currentRowTitle) {
      return -1;
    } else if (nextRowTitle < currentRowTitle) {
      return 1;
    } else {
      return 0;
    }
  };

  const sortedRows = Array.from(rows);

  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    arrowUp.classList.remove('hide');
    arrowDown.classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    arrowUp.classList.add('hide');
    arrowDown.classList.remove('hide');
  }

  sortedRows.forEach((sortedRow) => {
    sortedTbody.appendChild(sortedRow);
  });

  table.replaceChild(sortedTbody, tbody);
}
