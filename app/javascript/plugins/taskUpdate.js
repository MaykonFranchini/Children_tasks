export function taskUpdate() {

  document.addEventListener('turbolinks:load', ()=> {

    const task = document.getElementById('taskCheckbox');
    const submit = document.querySelector('.taskSubmit');

    if(task) {
      task.addEventListener('click', (event) => {
      if(!task.checked) {
        submit.classList.remove('checked');
        alert('Select the task before submit!');
      } else {
        submit.classList.add('checked');
      }
    })
    }


  })


}
