export function transactionFormDisplay() {
  window.addEventListener('load', ()=> {

    const form = document.getElementById('transactionForm');
    const link = document.getElementById('transactionLink');

    link.addEventListener('click', (event)=> {
      event.preventDefault();
      form.style.display = form.style.display == 'none' ? 'block' : 'none';
    })
  })
}
