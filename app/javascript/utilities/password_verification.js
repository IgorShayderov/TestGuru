document.addEventListener('turbolinks:load', function (e) {
  const registrationForm = document.querySelector('#new_user');

  if (registrationForm) {
    const userPasswordConfirmation = registrationForm.querySelector('#user_password_confirmation');

    if (userPasswordConfirmation) {
      const userPassword = registrationForm.querySelector('#user_password');
      const messageContainer = document.querySelector('#message-container');

      const passwordCoincide = () => {
        if (userPasswordConfirmation.value) {
          if (userPassword.value === userPasswordConfirmation.value) {
            if (!messageContainer.classList.contains('alert-success')) {
              messageContainer.classList.add('alert-success');
              messageContainer.classList.remove('alert-danger');
              messageContainer.innerHTML = "Пароль совпадает";
            }
          } else {
            if (!messageContainer.classList.contains('alert-danger')) {
              messageContainer.classList.add('alert-danger');
              messageContainer.classList.remove('alert-success');
              messageContainer.innerHTML = "Пароль не совпадает";
            }
          }
        }
      }

      userPassword.addEventListener('keyup', passwordCoincide);
      userPasswordConfirmation.addEventListener('keyup', passwordCoincide);
    }
  }
});
