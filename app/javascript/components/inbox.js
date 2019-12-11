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
    })
  }
}

export { inboxHover };
