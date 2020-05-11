document.addEventListener('turbolinks:load', function (e) {
  const registrationForm = document.querySelector('#new_user');

  if (registrationForm) {
    const userPassword = registrationForm.querySelector('#user_password');
    const userPasswordConfirmation = registrationForm.querySelector('#user_password_confirmation');
    const messageContainer = document.querySelector('#message-container');

    const passwordCoincide = () => {
      if (userPassword.value === userPasswordConfirmation.value) {
        messageContainer.classList.add('alert-success');
        messageContainer.classList.remove('alert-danger');
        messageContainer.innerHTML = "Пароль совпадает";
      } else {
        messageContainer.classList.add('alert-danger');
        messageContainer.classList.remove('alert-success');
        messageContainer.innerHTML = "Пароль не совпадает";
      }
    }

    userPassword.addEventListener('keyup', passwordCoincide);
    userPasswordConfirmation.addEventListener('keyup', passwordCoincide);
  }
});
