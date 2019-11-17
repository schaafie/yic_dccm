import './yic-ct-type.js';
import './yic-ct-checkbox.js';

const location = document.location.origin;
const template = document.createElement('template');
template.innerHTML = `
<style>
  @import "`+location+`/css/app.css";
    :host {
      display: block;
      font-family: sans-serif;
    }

    button {
      background-color: lightgrey;
      color:black;
      cursor: pointer;
    }
</style>
<yic-ct-type></yic-ct-type>
<yic-ct-checkbox label="required" name="required"></yic-ct-checkbox>
<yic-ct-checkbox label="multiple" name="multiple"></yic-ct-checkbox>
<button>Remove</button>
`;

class YicCtItem extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$removeButton = this._shadowRoot.querySelector('button');
    this.$removeButton.addEventListener('click', (e) => {
      this.dispatchEvent(new CustomEvent('onRemove', { detail: this._index }));
    });
    this.$cttype = this._shadowRoot.querySelector('yic-ct-type');
    this.$cttype.addEventListener('onChange', (e) => {
      this.dispatchEvent(new CustomEvent('onChange', {detail: { element: 'type', index: this._index, value: e.detail.value }}));
    });
    this.$ctrequired = this._shadowRoot.querySelector('yic-ct-checkbox[name="required"]');
    this.$ctrequired.addEventListener('onChange', (e) => {
      this.dispatchEvent(new CustomEvent('onChange', {detail: { element: 'required', index: this._index, value: e.detail.value }}));
    });
    this.$ctmultiple = this._shadowRoot.querySelector('yic-ct-checkbox[name="multiple"]');
    this.$ctmultiple.addEventListener('onChange', (e) => {
      this.dispatchEvent(new CustomEvent('onChange', {detail: { element: 'multiple', index: this._index, value: e.detail.value }}));
    });
  }

  set options(value) {
    this.$cttype.setAttribute("options", JSON.stringify(value));
  }

  static get observedAttributes() {
    return ['cttype', 'ctrequired', 'ctmultiple','index'];
  }

  attributeChangedCallback(name, oldValue, newValue) {
    switch(name){
      case 'cttype':
        this.$cttype.setAttribute('value', newValue);
        break;
      case 'ctrequired':
        if (newValue=="true") this.$ctrequired.setAttribute('checked', '');
        break;
      case 'ctmultiple':
        if (newValue=="true") this.$ctmultiple.setAttribute('checked', '');
        break;
      case 'index':
        this._index = newValue;
        break;
    }
  }

}
window.customElements.define('yic-ct-item', YicCtItem);
