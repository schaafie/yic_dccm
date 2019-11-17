const location = document.location.origin;
const template = document.createElement('template');
template.innerHTML = `
<style>
  @import "`+location+`/css/app.css";

  :host {
    display: inline;
    font-family: sans-serif;
  }
  label {display: inline}

</style>
<label></label>
<input type="checkbox" name="checkbox">
`;

class YicCtCheckbox extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$ctLabel = this._shadowRoot.querySelector('label');
    this.$ctElement = this._shadowRoot.querySelector('input');
    this.$ctElement.addEventListener('change', (e) => {
      this.dispatchEvent( new CustomEvent('onChange',
        { detail: { element: this._name, value: this.$ctElement.checked } } ));
    });
  }

  static get observedAttributes() {
    return ['name','label','checked'];
  }

  attributeChangedCallback(name, oldVal, newVal) {
    switch(name) {
      case "checked":
        this.$ctElement.setAttribute("checked", true);
        break;
      case "name":
        this._name = newVal;
        this.$ctElement.setAttribute( "name", newVal);
        break;
      case "label":
        this.$ctLabel.innerHTML = newVal;
        break;
    }
  }
}

window.customElements.define('yic-ct-checkbox', YicCtCheckbox);
