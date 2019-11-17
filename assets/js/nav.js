export default class YicNavbar {

  constructor() {
    this.navItems = document.querySelectorAll("nav.accordion li.unselected > div");
    this.navItems.forEach((item) => { item.addEventListener("click", this.flipNavItem.bind(this)); });
    this.navButton = document.querySelector("#nav_knob");
    this.navBar = document.querySelector("#navigationbar");
    this.navButton.addEventListener("click", this.flipNavButton.bind(this));
  }

  flipNavItem(e) {
    if (e.target.parentNode.classList.contains('unselected')) {
      e.target.parentNode.classList.remove('unselected');
      e.target.parentNode.classList.add('selected');
    } else {
      e.target.parentNode.classList.remove('selected');
      e.target.parentNode.classList.add('unselected');
    }
  }

  flipNavButton(e) {
    if (this.navBar.classList.contains('nav_open')) {
      this.navBar.classList.remove('nav_open');
      this.navBar.classList.add('nav_closed');
    } else {
      this.navBar.classList.remove('nav_closed');
      this.navBar.classList.add('nav_open');
    }
  }
}
