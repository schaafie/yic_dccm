import './yic-text-editor.js';

const location = document.location.origin;
const template = document.createElement('template');
template.innerHTML = `
<yic-text-editor></yic-text-editor>
`;

export default class YicCEBase extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$cb_item = this._shadowRoot.querySelector('yic-text-editor');
    this._index = 0;
    this._data = "";
    this._format = "";
    this._validations = [];
    this._handler = "";
  }

  connectedCallback() {
    this._render();
  }

  _render() {
    let item = {};
    switch (this._handler) {
      case 'input':
        this.$cb_item.setAttribute("data", this._data);
        this.$cb_item.setAttribute("type", "basic");
        this.$cb_item.setAttribute("multi", false);
        this.$cb_item.addEventListener("change", this._changeCE.bind(this));
        break;
      case 'rich-editor':
        this.$cb_item.setAttribute("data", this._data);
        this.$cb_item.setAttribute("type", "full");
        this.$cb_item.setAttribute("multi", true);
        this.$cb_item.addEventListener("change", this._changeCE.bind(this));
        break;
    }
  }

  _changeCE(e) {
    this._data = e.detail.value;
    this.dispatchEvent(new CustomEvent('change', {detail: {value: this._data, index: this._index }}));
  }

  set validations(value) {
    this._validations = value;
  }

  set index(value) {
    this.setAttribute("index", value);
    this._index = value;
  }

  set data(value) {
    //this.setAttribute("index", value);
    this._data = value;
  }

  set format(value) {
    this._format = value;
  }

  set handler(value) {
    this._handler = value;
  }
}

window.customElements.define('yic-ce-base', YicCEBase);
