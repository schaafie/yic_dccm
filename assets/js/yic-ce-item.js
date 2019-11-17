import './yic-ce-base.js';

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
    padding: 0 0 0 1.5rem;
  }
  .itemheader {
      background-color: #eee;
      border: 2px solid black;
      padding: 2px 5px;
      font-weight: bold;
  }
  .titel {
    color: #333;
    font-style: italic;
    font-weight: bold;
  }
  .itembody {
    border: 1px solid grey;
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
  img.intLink {
    float: right;
    backgroundcolor:white;
    opacity: 0.70;
    border: 1px solid grey;
    padding: 3px;
    margin: 1px;
    border-radius: 5px;
    cursor: pointer;
  }
</style>
<div class="container">
  <div class="itemheader">
    <span class="titel"></span>
    <select id="childselector">
    </select>
    <img class="intLink" title="Up" id="btn_up" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAAmJLR0QAAKqNIzIAAAAHdElNRQfjChcNEQH3fDTeAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTIzVDEzOjE3OjAxKzAwOjAw6WFAyQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0yM1QxMzoxNzowMSswMDowMJg8+HUAAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAoElEQVQ4T9WTwQrDIBBE1970DwT//+PUgwgq6MGq1TbqpoSWHvpgENyZIVmQ5AJ8wa2fH/O7ghACEEKanHP9FqHuYKWE614mlZI+ndkKsPCQ9767XkwF78JD65c8C66Eh44lreAsbIzJ1lp0Nn4HUkqoQUrZDBWlFOqJMWZgjG2DGljRWm8+SmkGIcR0iYUHawnn/LGDK+HBsaTy948J4A6gsnf3pPicwwAAAABJRU5ErkJggg==">
    <img class="intLink" title="Down" id="btn_down" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAAmJLR0QAAKqNIzIAAAAHdElNRQfjChcNEDMmsFQfAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTIzVDEzOjE2OjUxKzAwOjAwTkMlkwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0yM1QxMzoxNjo1MSswMDowMD8enS8AAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAnElEQVQ4T9WTQQrDIBBFx67EGwje/3K6ERFBBOuXRDSZhJJ20wcfQee/xYCiNugLXtv5mN8IhBA91tp+eYdzbsx3jDHYwUiTYC0srbzMaq0rKaWWS4STHMuIlLJSKeX0gMwSrozknCthIKXEDnjvawiBfYsxdnkXgCsJl70MhgB8IpnLYBGAO8mxDE4CwEm4MmAFYJZclcHffyaiN84nff3m52hkAAAAAElFTkSuQmCC">
    <img class="intLink" title="Remove" id="btn_del" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAAmJLR0QAAKqNIzIAAAAHdElNRQfjChcNES8rqjkRAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTIzVDEzOjE3OjQ3KzAwOjAwDvt7CQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0yM1QxMzoxNzo0NyswMDowMH+mw7UAAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAk0lEQVQ4T6WTYQ6AIAiFqRO4eRLvfx/9oZ6B5E0alWsrvu3pVEBBJZ6klJiIuLU2Z57UWmEjtgoChBCwoCqlYNGSc77YiI9AuvNdNsjdWSW+2xws6b2jjzGiX6J5/RF83474Jk3xvIUvQWx9zgDCyHnpYCU2ln1M+piBfCm4iui9Rv9D8j5l1MD1mdAO9CTfvjPzAV1TxMy0NyVFAAAAAElFTkSuQmCC">
    <img class="intLink" title="Add" id="btn_add" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAAmJLR0QAAKqNIzIAAAAHdElNRQfjChcNERZ0r7EZAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTIzVDEzOjE3OjIyKzAwOjAwmqxdKQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0yM1QxMzoxNzoyMiswMDowMOvx5ZUAAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAnUlEQVQ4T82SYQ6DIAyFC/wB7n8vCITr0PEIM4pUXZYl+5Iq1rxq+0osUEph7z075zjnPLJnFC60wBhDtdZ+Vkpt5xk97if2AuEbHbHAU35XAH0/AtPWWqPJLZr48LzKQZNSYoJV+xefBCz+agbdHSzJ6pfvApoYo7xIrceD/9IuiC1Igpk/XiTM4M3VUokF2oSp+UzWWgohjOwM0QunPpgYlpL+sgAAAABJRU5ErkJggg==">
  </div>
  <div class="itembody">
  </div>
</div>
`;

export default class YicCEItem extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this.$ce_titel = this._shadowRoot.querySelector('.titel');
    this._data = [];
    this._type = '';
    this._index = 0;
    this._definition = [];
    this.$ce_header = this._shadowRoot.querySelector('.itemheader');
    this.$ce_elements = this._shadowRoot.querySelector('.itembody');
    this.$ce_remove = this._shadowRoot.querySelector('#btn_del');
    this.$ce_up = this._shadowRoot.querySelector('#btn_up');
    this.$ce_down = this._shadowRoot.querySelector('#btn_down');
    this.$ce_select = this._shadowRoot.querySelector('#childselector');

  }
  connectedCallback() {
    this._render();
  }

  _render() {
    this.$ce_titel.innerHTML = this._type;
    this.$ce_elements.innerHTML = '';
    this.$ce_select.innerHTML = '<option>Add element</option>';

    this._data.forEach((element, index) => {
      if (element.type=="base") {
        let item = document.createElement("yic-ce-base");
        item.parent = this;
        item.classList.add("base");
        item.type = element.type;
        item.index = index;
        item.data = element.data;
        item.format = element.format;
        item.handler = element.handler;
        item.validations = element.validations;
        this.$ce_elements.appendChild(item);
        item.addEventListener("change", this._changeCE.bind(this));
      } else {
        if (element.multiple && !this.hasOption(element.type)) {
          let option = document.createElement('option');
          option.innerHTML = element.type;
          option.setAttribute('value',element.type);
          this.$ce_select.appendChild( option );
        }
        let item = document.createElement("yic-ce-item");
        item.parent = this;
        item.type = element.type;
        item.index = index;
        item.data = element.data;
        item.multiple = this._multiple;
        item.required = this._required;
        item.definition = this._definition;
        // Specific handler properties
        item.canadd = (element.multiple);
        item.canmoveup = (this._data.length>1) && (index > 0);
        item.canmovedown = (this._data.length>1) && (index < (this._data.length -1));
        item.canremove = !element.required || this._data.length > 1;
        // Listen if any child of mine tells me to do an action
        item.addEventListener('delete', this._delete.bind(this));
        item.addEventListener('moveup', this._moveup.bind(this));
        item.addEventListener('movedown', this._movedown.bind(this));
        item.addEventListener("change", this._changeCE.bind(this));
        this.$ce_elements.appendChild(item);
      }
    });
    if (this.$ce_select.length>1) {
      this.$ce_select.addEventListener('change', this._addChild.bind(this));
    } else {
      this.$ce_select.classList.add("hidden");
    }
  }

  hasOption(option) {
    let options = this.$ce_select.options;
    for(let i=0;i<options.length;i++) {
      if (options[i].value==option) return true;
    }
    return false;
  }

  _addChild(e) {
    let children = this.findChildren(e.target.value);
    if (children.length > 0) {
      let newData = this.addChildren(children);
      this._data.push({
        type: e.target.value,
        required: this._required,
        multiple: this._multiple,
        data: newData
      });
      this.$ce_select.selectedIndex = 0;
      this._render();
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

  _changeCE(e) {
    // Add received value to the data
    this._data[e.detail.index].data = e.detail.value;
    // Trigger event with new data
    this.dispatchEvent(new CustomEvent('change',{detail: { value: this._data, index: this._index }}));
  }

  _moveup(e) {
    if (e.detail.index>0 && e.detail.index<this._data.length) {
      let goingup = this._data[e.detail.index];
      let goingdown = this._data[e.detail.index -1];
      this._data[e.detail.index] = goingdown;
      this._data[e.detail.index-1] = goingup;
      this._propChange();
      this._render();
    }
  }

  _movedown(e) {
    if (e.detail.index>=0 && e.detail.index<(this._data.length -1)) {
      let goingdown = this._data[e.detail.index];
      let goingup = this._data[e.detail.index+1];
      this._data[e.detail.index+1] = goingdown;
      this._data[e.detail.index] = goingup;
      this._propChange();
      this._render();
    }
  }

  _delete(e) {
    if (e.detail.index >= 0 && this._data.length > e.detail.index ) {
      this._data.splice(e.detail.index, 1);
      this._propChange();
      this._render();
    }
  }

  _propChange() {
    this.dispatchEvent(new CustomEvent('change',{detail: { value: this._data, index: this._index }}));
  }

  _doEvent(eventName) {
    this.dispatchEvent( new CustomEvent( eventName,
      {detail:{index:this._index,type:this._type}}
    ));
  }

  set canremove(value) {
    // If true we can show the delete button
    if (value) {
      this.$ce_remove.addEventListener("click", this._doEvent.bind(this,'delete'));
    } else {
      this.$ce_remove.classList.add("hidden");
    }
  }

  set canmoveup(value) {
    if (value) {
      this.$ce_up.addEventListener("click", this._doEvent.bind(this,'moveup'));
    } else {
      this.$ce_up.classList.add("hidden");
    }
  }

  set canmovedown(value) {
    if (value) {
      this.$ce_down.addEventListener("click", this._doEvent.bind(this,'movedown'));
    } else {
      this.$ce_down.classList.add("hidden");
    }
  }

  set multiple(value) {
    this.setAttribute("multiple", value);
    this._multiple = value;
  }

  set required(value) {
    this.setAttribute("required", value);
    this._required = value;
  }

  set type(value) {
    this.setAttribute("type", value);
    this._type = value;
  }

  set index(value) {
    this.setAttribute("index", value);
    this._index = value;
  }

  set definition(value) {
    this._definition = value;
  }

  set data(value) {
    this._data = value;
  }

}

window.customElements.define('yic-ce-item', YicCEItem);
