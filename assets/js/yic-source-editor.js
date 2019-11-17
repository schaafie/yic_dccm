import CodeMirror from "codemirror"
import '../node_modules/codemirror/mode/htmlmixed/htmlmixed.js';
import '../node_modules/codemirror/theme/seti.css';

const location = document.location.origin;
const template = document.createElement('template');
template.innerHTML = `
<style>
  @import "`+location+`/css/app.css";
  #sourceBox { padding-bottom: 1.5rem; }
</style>
<div id="sourceBox"></div>
`;

export default class YicSourceEditor extends HTMLElement {

  static get formAssociated() { return true; }

  constructor() {
    super();
    this._internals = this.attachInternals();
    this._data = '';
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$editor = this._shadowRoot.querySelector('#sourceBox');
  }

  get form() { return this._internals.form; }
  get name() { return this.getAttribute('name'); }
  get type() { return this.localName; }
  get value() { return this._data; }

  handleChange(e) {
    this._data = this.editor.getValue();
    this._internals.setFormValue(this._data);
    this.dispatchEvent(new CustomEvent('change',{detail:{value:this._data}}));
  }

  connectedCallback() {
    this.editor = CodeMirror(this.$editor, {
      value: this._data,
      mode: "htmlmixed",
      lineNumbers: true,
      theme: 'seti'
    });
    this.editor.doc.on('change', this.handleChange.bind(this));
  }

  static get observedAttributes() {return ['value'];}

  attributeChangedCallback(name, oldValue, newValue) {
    if (oldValue != newValue) {
      switch(name) {
        case 'value':
          this._data = newValue;
          if (this.editor) this.editor.setValue(newValue);
          break;
      }
    }
  }
}

window.customElements.define('yic-source-editor', YicSourceEditor);
