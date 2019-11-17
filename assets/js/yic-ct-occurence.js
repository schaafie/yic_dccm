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
<select placeholder="select ordinal of this element">
  <option value="01">1 (optional)</option>
  <option value="0n">multiple (optional)</option>
  <option value="1">exact 1 (required)</option>
  <option value="1n">multiple (required)</option>
</select>
`;

class YicCtOccurence extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$ctElement = this._shadowRoot.querySelector('select');
    this.$ctElement.addEventListener('change', (e) => {
      this.dispatchEvent(new CustomEvent('onChange', {detail: { element: 'occurence', value: this.$ctElement.value }}));
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

window.customElements.define('yic-ct-occurence', YicCtOccurence);
