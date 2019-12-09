
const issueCardHover = () => {
  const issueCards = document.querySelector(".issue-cards");
  if (issueCards) {
    const cards = document.querySelectorAll(".issue-card");
    cards.forEach(card => {
      card.addEventListener("mouseenter", event => {
        event.currentTarget.children[0].style.opacity = "0.2";
      })
      card.addEventListener("mouseout", event => {
        event.currentTarget.children[0].style.opacity = "0.5";
      })
    })
    const cardsContent = document.querySelectorAll(".issue-card-content h1");
    cardsContent.forEach(content => {
      content.addEventListener("mouseenter", event => {
        event.currentTarget.parentElement.parentElement.children[0].style.opacity = "0.2";
      })
    })

  }
}

export { issueCardHover };
