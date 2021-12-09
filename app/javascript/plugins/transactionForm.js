export function transactionFormDisplay() {
  document.addEventListener('turbolinks:load', ()=> {

    const form = document.getElementById('transactionForm');
    const link = document.getElementById('transactionLink');

    if (link) {
      link.addEventListener('click', (event)=> {
      event.preventDefault();

      if (form) {
        form.style.display = form.style.display == 'none' ? 'block' : 'none';
      }
    })
    }
  })
}
