import './yic-ce-item.js';

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
  .itemheader {
      background-color: #eee;
      border: 2px solid black;
      padding: 2px 5px;
      font-weight: bold;
  }
  .itembody {
    border: 1px solid grey;
    margin-bottom: 1.5rem;
  }
  #childselector {
    float: right;
    backgroundcolor:white;
    border: 1px solid grey;
    padding: 3px;
    margin: 1px;
    height: 2.2rem;
    border-radius: 5px;
    line-height:1.5rem;
    cursor: pointer;
  }
</style>
<div class="container elements">
  <div class="itemheader">
    <span class="titel">
    </span>
    <select id="childselector"></select>
  </div>
  <div class="itembody">
  </div>
</div>
`;

export default class YicContentElement extends HTMLElement {
  constructor() {
    super();
    this._level = 0;
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$ce_header = this._shadowRoot.querySelector('.itemheader');
    this.$ce_titel = this._shadowRoot.querySelector('.titel');
    this.$ce_body = this._shadowRoot.querySelector('.itembody');
    this.$ce_select = this._shadowRoot.querySelector('#childselector');
    this.$ce_select.addEventListener('change', this._addChild.bind(this));
  }

  connectedCallback() {
    let selector = 'textarea[wc="'+this.id+'"]';
    this._connectedInput = document.querySelector(selector);
    if (this._connectedInput) {
      this.setAttribute('value',this._connectedInput.value);
    }
  }

  _render() {
    this.$ce_titel.innerHTML = this._rootelement;
    this.$ce_body.innerHTML = "";
    this.$ce_select.innerHTML = '<option>Add element</option>';
    let children = this.findChildren(this._rootelement);
    children.forEach((element) => {
      let option = document.createElement('option');
      option.innerHTML = element.type;
      option.setAttribute('value',element.type);
      this.$ce_select.appendChild( option );
    });
    this._data.forEach((element, index) => {
      let item = document.createElement('yic-ce-item');
      item.type = element.type;
      item.index = index;
      item.data = element.data;
      item.parent = this;
      item.definition = this._definition;
      item.multiple = element.multiple;
      item.required = element.required;
      item.canadd = (element.multiple);
      item.canremove = !element.required || this.hasMultipleSameElements(this._data, element.type);
      item.canmoveup = (this._data.length>1) && (index > 0)
      item.canmovedown = (this._data.length>1) && (index < (this._data.length -1));
      item.setAttribute("data", JSON.stringify( element.data) );
      item.addEventListener('change', this._changeCE.bind(this));
      item.addEventListener('delete', this._delete.bind(this));
      item.addEventListener('moveup', this._moveup.bind(this));
      item.addEventListener('movedown', this._movedown.bind(this));
      this.$ce_body.appendChild(item);
    });
  }

  _addChild(e) {
    let baseList = this.findChildren(this._rootelement);
    let item = false;
    baseList.forEach((element) =>{
      if (element.type == e.target.value) item =  element;
    });
    if (item) {
      let children = this.findChildren(e.target.value);
      if (children.length >0) {
        let newData = this.addChildren(children);
        item.data = newData;
        this._data.push( item );
        this._render();
        this._EventCE();
      }
    }
  }

  addChildren(list) {
    list.forEach((element, index) => {
      let childList = this.findChildren(element.type);
      if (childList[0].type == "base") {
        list[index].data = childList;
        list[index].data[0].data = "";
      } else {
        list[index].data = this.addChildren(childList);
      }
    });
    return list;
  }

  findChildren(type) {
    let children = [];
    this._definition.forEach((element) => {
      if(element[type]) children = element[type];
    });
    return children;
  }

  notPresent(list, type) {
    let count = 0;
    list.forEach((element) => { if (type == element.type) count++ });
    return (count==1);
  }


  hasMultipleSameElements(list, type) {
    let count = 0;
    list.forEach((element) => { if (type == element.type) count++ });
    return (count>1);
  }

  _moveup(e) {
    if (e.detail.index>0 && e.detail.index<this._data.length) {
      let goingup = this._data[e.detail.index];
      let goingdown = this._data[e.detail.index -1];
      this._data[e.detail.index] = goingdown;
      this._data[e.detail.index-1] = goingup;
    }
    this._render();
    this._EventCE();
  }

  _movedown(e) {
    if (e.detail.index>=0 && e.detail.index<(this._data.length -1)) {
      let goingdown = this._data[e.detail.index];
      let goingup = this._data[e.detail.index+1];
      this._data[e.detail.index+1] = goingdown;
      this._data[e.detail.index] = goingup;
      this._render();
      this._EventCE();
    }
  }

  _delete(e) {
    if (e.detail.level+1 == this._level) {
      if (e.detail.index >= 0 && this._data.length > e.detail.index ) {
        this._data.splice(e.detail.index, 1);
      }
      this._render();
      this._EventCE();
    }
  }

  _changeCE(e) {
    // Process the received data
    this._data[e.detail.index].data = e.detail.value;
    // Handle feedback loop
    this._EventCE();
  }

  _EventCE() {
    this._orgvalue.data.data = this._data;
    this.dispatchEvent(new CustomEvent('onChange', {detail: {value: this._orgvalue }}));
    if (this._connectedInput) {
      this._connectedInput.value = JSON.stringify( this._orgvalue );
    }
  }

  static get observedAttributes() { return ['value']; }

  attributeChangedCallback(name, oldValue, newValue) {
    this._orgvalue = JSON.parse(newValue);
    this._rootelement = this._orgvalue.type;
    this._definition = this._orgvalue.definition;
    this._datadef = this._orgvalue.data;
    this._data = this._datadef.data;
    this._render();
  }
}

window.customElements.define('yic-content-element', YicContentElement);
