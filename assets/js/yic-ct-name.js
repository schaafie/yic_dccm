const location = document.location.origin;
const template = document.createElement('template');
template.innerHTML = `
<style>
  @import "`+location+`/css/app.css";
  
  :host {
    display: inline;
    font-family: sans-serif;
  }
  input[type='text'] {
    width: 10em;
  }
</style>
<input type="text" placeholder="Name of element" />
`;

class YicCtName extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$ctElement = this._shadowRoot.querySelector('input');
    this.$ctElement.addEventListener('change', (e) => {
      this.dispatchEvent(new CustomEvent('onChange', {detail: { element: 'name', value: this.$ctElement.value  }}));
    });
  }

  static get observedAttributes() {
    return ['value'];
  }

  attributeChangedCallback(name, oldVal, newVal) {
    switch(name) {
      case "value":
        this.$ctElement.value = newVal;
        break;
    }
  }
}

window.customElements.define('yic-ct-name', YicCtName);
