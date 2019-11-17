const location = document.location.origin;
const template = document.createElement('template');
template.innerHTML = `
<style>
  @import "`+location+`/css/app.css";

  :host {
    display: inline;
    font-family: sans-serif;
  }
</style>
<select placeholder="select type of this element">
  <option>Select type</option>
</select>
`;

class YicCtType extends HTMLElement {
  constructor() {
    // always call super() first
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$ctElement = this._shadowRoot.querySelector('select');
    this.$ctElement.addEventListener('change', (e) => {
      this.dispatchEvent(new CustomEvent('onChange', {detail: { element: 'type', value: this.$ctElement.value }}));
    });
  }

  static get observedAttributes() { return ['value', 'options']; }

  attributeChangedCallback(name, oldVal, newVal) {
    switch(name) {
      case "value":
        this.$ctElement.value = newVal;
        break;
      case "options":
        JSON.parse(newVal).forEach((item, index) => {
          let option = document.createElement('option');
          option.setAttribute('value', item.name);
          option.innerHTML = item.name;
          this.$ctElement.appendChild(option);
        });
    }
  }
}

window.customElements.define('yic-ct-type', YicCtType);
