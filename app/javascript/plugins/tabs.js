export function tabs() {
  window.addEventListener('load', ()=> {
    const tabs = document.querySelectorAll('.tab-underlined');
    const contents = document.querySelectorAll('.content');


    tabs.forEach((element) => {
      element.addEventListener("click", (event) => {
        event.preventDefault();

        tabs.forEach((link) => {
        link.classList.remove('active')
        })

        contents.forEach((content) => {
          content.classList.remove('show')
          console.log(content.dataset.info)
        })

      element.classList.add('active')
        contents.forEach((content) => {
          if (content.dataset.info === element.innerText) {
            content.classList.add('show')
          }
        })
      })
    })
  })
}
