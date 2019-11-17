import './yic-ct-item.js';

const location = document.location.origin;
const template = document.createElement('template');
template.innerHTML = `
<style>
  @import "`+location+`/css/app.css";

  :host {
    display: block;
    font-family: sans-serif;
    text-align: left;
  }
  button {
    cursor: pointer;
    background-color:lightgrey;
    color:black;
  }
</style>
<div class="rows">
</div>
<button>Add Element</button>
`;

export default class YicContentType extends HTMLElement {

  // Tell the form that this is an input element
  static get formAssociated() { return true; }

  constructor() {
    super();
    this._internals = this.attachInternals();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this._contenttypes = [];
    this._options = [];
    this.$ctitems = this._shadowRoot.querySelector('.rows');
    this.$submitButton = this._shadowRoot.querySelector('button');
    this.$submitButton.addEventListener('click', this._addCT.bind(this));

    fetch(location+'/api/allcontenttypes')
      .then(response => response.json())
      .then(data => {
        this._options = data.data;
        this._renderCTList();
      });
  }

  // Getters for interaction with the form required elements
  get form() { return this._internals.form; }
  get name() { return this.getAttribute('name'); }
  get type() { return this.localName; }

  connectedCallback() {
    this._renderCTList();
  }

  _removeCT(e) {
    this._contenttypes.splice(e.detail, 1);
    this._renderCTList();
    this._EventCT();
  }

  _addCT(e) {
    this._contenttypes.push({ type: '', required: false, multiple: false });
    this._renderCTList();
    this._EventCT();
  }

  _renderCTList() {
    this.$ctitems.innerHTML = "";
    this._contenttypes.forEach((contenttype, index) => {
      let $CTItem = document.createElement('yic-ct-item');
      $CTItem.options = this._options;
      $CTItem.setAttribute('cttype', contenttype.type);
      $CTItem.setAttribute('ctrequired', contenttype.required);
      $CTItem.setAttribute('ctmultiple', contenttype.multiple);
      $CTItem.setAttribute('index', index);
      $CTItem.addEventListener("onChange", this._changeCT.bind(this));
      $CTItem.addEventListener('onRemove', this._removeCT.bind(this));
      this.$ctitems.appendChild($CTItem);
    });
  }

  _changeCT(e) {
    switch(e.detail.element) {
      case 'type':
        this._contenttypes[e.detail.index].type = e.detail.value;
        break;
      case 'multiple':
        this._contenttypes[e.detail.index].multiple = e.detail.value;
        break;
      case 'required':
        this._contenttypes[e.detail.index].required = e.detail.value;
        break;
    }
    this._EventCT();
  }

  _EventCT() {
    this.dispatchEvent(new CustomEvent('change', {detail:{value:this._contenttypes }}));
    this._internals.setFormValue(JSON.stringify(this._contenttypes));
  }

  get value() { return JSON.stringify(this._contenttypes); }

  static get observedAttributes() { return ['value']; }

  attributeChangedCallback(name, oldValue, newValue) {
    this._contenttypes = JSON.parse(newValue);
  }
}

window.customElements.define('yic-content-type', YicContentType);
