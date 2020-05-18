document.addEventListener('turbolinks:load', function (e) {
  const badgesForm = document.querySelector('.badges-form');

  if (badgesForm) {
    badgesForm.addEventListener('click', (event) => {
      if (event.target.classList.contains('icons-select__item')) {
        const badgeIconField = document.querySelector('#badge_icon');
        const targetIcon = event.target;

        if (!targetIcon.classList.contains('icons-select__item_selected')) {
          const allIcons = badgesForm.querySelectorAll('.icons-select__item');

          allIcons.forEach((icon) => {
            if (icon.classList.contains('icons-select__item_selected') && icon !== targetIcon) {
              icon.classList.remove('icons-select__item_selected');
            }
          });
          targetIcon.classList.add('icons-select__item_selected');
          badgeIconField.value = targetIcon.dataset.icon;
        }
      }
    });
  }
});