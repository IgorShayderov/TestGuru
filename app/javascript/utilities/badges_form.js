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
    const selectCondition = badgesForm.querySelector('#badge_condition');

    selectCondition.addEventListener('change', (event) => {
      const formSelect = badgesForm.querySelector('select[name="badge\[condition_param\]"]');
      const response = fetch(`/admin/${selectCondition.value}/get_collection`);

      response.then((response) => {
        return response.json();
      })
      .then((data) => {
        formSelect.querySelectorAll('option').forEach((option) => {
          option.remove();
        });
        data.forEach((elem) => {
          const newOption = document.createElement('option');

          if (typeof elem == 'object') {
            newOption.value = elem.id;
            newOption.innerHTML = elem.title;
          } else {
            newOption.value = elem;
            newOption.innerHTML = elem;
          }
          formSelect.append(newOption);
        });
      })
      .catch((error) => {
        console.log(error);
      });
    });
  }
});
