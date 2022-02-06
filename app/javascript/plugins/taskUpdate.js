export function taskUpdate() {

  document.addEventListener('turbolinks:load', ()=> {

    const tasks = document.querySelectorAll('.taskCheckbox');
    const submit = document.querySelectorAll('.taskSubmit');

    if(tasks) {
      tasks.forEach((task) => {
        task.addEventListener('click', (event) => {
      if(task.checked) {
        const button = document.getElementById(task.dataset.button);
        button.disabled = false;
        button.classList.add('checked');
      } else {
        submit.forEach((button) => {
          button.classList.remove('checked');
          button.disabled = true;
        })
      }
    })
      })
    }


  })


}
