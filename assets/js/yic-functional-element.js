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
  .container {
    padding: 0;
  }
</style>
<label for="typeselector">Type</label>
<select id="fc_typeselector">
  <option value="html">HTML</option>
  <option value="css">CSS</option>
  <option value="javascript">Javascript</option>
</select>
<label for="fc_sourceselector">Source</label>
<select id="fc_sourceselector">
  <option value="url">URL</option>
  <option value="data">Data</option>
</select>
<label for="fc_definition">Definition</label>
<input id="fc_url" value="" type="text">
<yic-source-editor id="fc_data" value=""></yic-source-editor>
`;

export default class YicFunctionalElement extends HTMLElement {
  // Tell the form that this is an input element
  static get formAssociated() { return true; }

  constructor() {
    super();
    this._internals = this.attachInternals();
    this._data = "";
    this._url = "";
    this._type = "html";
    this._source = "url";
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$source = this._shadowRoot.querySelector('#fc_sourceselector');
    this.$source.addEventListener("change",(e) => {this._changeCE(e,'source')});
    this.$type = this._shadowRoot.querySelector('#fc_typeselector');
    this.$type.addEventListener("change",(e) => {this._changeCE(e,'type')});
    this.$url = this._shadowRoot.querySelector('#fc_url');
    this.$url.addEventListener("change",(e) => {this._changeCE(e, 'url')});
    this.$data = this._shadowRoot.querySelector('#fc_data');
    this.$data.addEventListener("change",(e) => {this._changeCE(e,'data')});
  }

  // Getters for interaction with the form required elements
  get form() { return this._internals.form; }
  get name() { return this.getAttribute('name'); }
  get type() { return this.localName; }
  get value() { return this._value; }

  connectedCallback() {}

  _render() {
    this.$source.value = this._source;
    this.$type.value = this._type;
    if (this._source == "url") {
      this.$url.value = this._url;
      this.$url.classList.remove("hidden");
      this.$data.classList.add("hidden");
    }
    if (this._source == "data") {
      this.$url.classList.add("hidden");
      this.$data.classList.remove("hidden");
      this.$data.setAttribute("value", this._data);
    }
  }

  _changeCE(e, type) {
    switch(type) {
      case 'source':
        this._source = e.target.value;
        this._render();
        break;
      case 'type':
        this._type = e.target.value;
        break;
      case 'url':
        this._url = e.target.value;
        break;
      case 'data':
        this._data = e.detail.value;
        break;
    }
    this._value = {
      source: this._source,
      type: this._type,
      url: this._url,
      data: this._data
    };

    this._internals.setFormValue(JSON.stringify(this._value));
    this.dispatchEvent(new CustomEvent('change',{detail:{value:this._value}}));
  }

  static get observedAttributes() { return ['value']; }

  attributeChangedCallback(name, oldValue, newValue) {
    this._value = (newValue=="")?{}:JSON.parse(newValue);
    // css / html / javascript
    if (this._value.hasOwnProperty("type")){ this._type = this._value.type; }
    // url or data
    if (this._value.hasOwnProperty("source")){ this._source = this._value.source; }
    // source location
    if (this._value.hasOwnProperty("url")){ this._url = this._value.url; }
    if (this._value.hasOwnProperty("data")){ this._data = this._value.data; }
    this._render();
  }
}

window.customElements.define('yic-functional-element', YicFunctionalElement);
