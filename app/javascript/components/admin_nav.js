const adminNav = () => {
  const nav = document.querySelector('.admin-nav');
  if (nav) {
    let navItemToggle = document.querySelectorAll('.item-toggle');
    navItemToggle.forEach(navItem => {
      navItem.addEventListener("click", (event) => {
        const id = event.currentTarget.id;
        const subItems = document.querySelectorAll(`.${id}`);
        subItems.forEach(subItem => {
          if (subItem.style.display === "list-item") {
            subItem.style.display = "none";
            event.currentTarget.classList.remove("active");
          } else {
            subItem.style.display = "list-item";
            event.currentTarget.classList.add("active");
          }
        })
      })
    })
  }

}

export { adminNav }
