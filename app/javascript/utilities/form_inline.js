document.addEventListener('turbolinks:load', function (e) {
  const controls = document.querySelectorAll('.form-inline-link');

  const formInlineHandler = (testId) => {
    const $link = $(`.form-inline-link[data-test-id="${testId}"]`);
    const $testTitle = $(`.test-title[data-test-id="${testId}"]`);
    const $formInline = $(`.form-inline[data-test-id="${testId}"]`);

    $formInline.toggle();
    $testTitle.toggle();

    if ($formInline.is(':visible')) {
      $link.textContent = 'Отменить';
    } else {
      $link.textContent = 'Редактировать';
    }
  };

  const formInlineLinkHandler = (event) => {
    const testId = event.target.dataset.testId;

    event.preventDefault();

    formInlineHandler(testId);
  };

  if (controls.length) {
    controls.forEach((element) => {
      element.addEventListener('click', formInlineLinkHandler);
    });
  }

  const errors = document.querySelector('.resource-erors');

  if (errors) {
    const resource_id = errors.dataset.resource_id;

    formInlineHandler(resource_id);
  }
});
