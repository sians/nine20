const inbox = document.querySelector('.inbox-container');

const inboxHover = () => {
  if (inbox) {
    const contactCards = document.querySelectorAll('.contact-card');
    contactCards.forEach(card => {
      card.addEventListener('mouseenter', event => {
        event.currentTarget.querySelector('#hover-menu').style.display = "flex";
      });
      card.addEventListener('mouseleave',  event => {
        event.currentTarget.querySelector('#hover-menu').style.display = "none";
      })
      card.addEventListener('click', event => {
        if (event.currentTarget.classList.contains("expanded")) {
          event.currentTarget.classList.remove("expanded");
        } else {
          event.currentTarget.classList.add("expanded");
        }
      })
    })
  }
}



export { inboxHover };
