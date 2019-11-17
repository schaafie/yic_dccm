const template = document.createElement('template');
template.innerHTML = `
  <style type="text/css">
    :host {
      display: block;
      font-family: sans-serif;
      text-align: left;
    }
    #toolBar {
      line-height:3rem;
      background-color:#d1d1d1;
    }
    .intLink {
      margin: .3rem 0 .3rem .3rem;
      cursor: pointer;
      vertical-align: bottom;
    }
    #toolBar select {
      background-color:#b7b7b7;
      padding:.2rem;
    }
    #sourceBox {
      color: white;
      border: 1px #d1d1d1 solid;
      background-color: #333;
      padding: .6rem 1rem;
      min-height: 500px;
      margin-bottom: 1.5rem;
    }
  </style>

  <div id="toolBar" class="full">
    <img class="intLink basic" title="Undo" id="undo" src="data:image/gif;base64,R0lGODlhFgAWAOMKADljwliE33mOrpGjuYKl8aezxqPD+7/I19DV3NHa7P///////////////////////yH5BAEKAA8ALAAAAAAWABYAAARR8MlJq7046807TkaYeJJBnES4EeUJvIGapWYAC0CsocQ7SDlWJkAkCA6ToMYWIARGQF3mRQVIEjkkSVLIbSfEwhdRIH4fh/DZMICe3/C4nBQBADs=" />
    <img class="intLink basic" title="Redo" id="redo" src="data:image/gif;base64,R0lGODlhFgAWAMIHAB1ChDljwl9vj1iE34Kl8aPD+7/I1////yH5BAEKAAcALAAAAAAWABYAAANKeLrc/jDKSesyphi7SiEgsVXZEATDICqBVJjpqWZt9NaEDNbQK1wCQsxlYnxMAImhyDoFAElJasRRvAZVRqqQXUy7Cgx4TC6bswkAOw==" />
    <img class="intLink extra" title="Cut" id="cut" src="data:image/gif;base64,R0lGODlhFgAWAIQSAB1ChBFNsRJTySJYwjljwkxwl19vj1dusYODhl6MnHmOrpqbmpGjuaezxrCztcDCxL/I18rL1P///////////////////////////////////////////////////////yH5BAEAAB8ALAAAAAAWABYAAAVu4CeOZGmeaKqubDs6TNnEbGNApNG0kbGMi5trwcA9GArXh+FAfBAw5UexUDAQESkRsfhJPwaH4YsEGAAJGisRGAQY7UCC9ZAXBB+74LGCRxIEHwAHdWooDgGJcwpxDisQBQRjIgkDCVlfmZqbmiEAOw==" />
    <img class="intLink extra" title="Copy" id="copy" src="data:image/gif;base64,R0lGODlhFgAWAIQcAB1ChBFNsTRLYyJYwjljwl9vj1iE31iGzF6MnHWX9HOdz5GjuYCl2YKl8ZOt4qezxqK63aK/9KPD+7DI3b/I17LM/MrL1MLY9NHa7OPs++bx/Pv8/f///////////////yH5BAEAAB8ALAAAAAAWABYAAAWG4CeOZGmeaKqubOum1SQ/kPVOW749BeVSus2CgrCxHptLBbOQxCSNCCaF1GUqwQbBd0JGJAyGJJiobE+LnCaDcXAaEoxhQACgNw0FQx9kP+wmaRgYFBQNeAoGihCAJQsCkJAKOhgXEw8BLQYciooHf5o7EA+kC40qBKkAAAGrpy+wsbKzIiEAOw==" />
    <img class="intLink extra" title="Paste" id="paste" src="data:image/gif;base64,R0lGODlhFgAWAIQUAD04KTRLY2tXQF9vj414WZWIbXmOrpqbmpGjudClFaezxsa0cb/I1+3YitHa7PrkIPHvbuPs+/fvrvv8/f///////////////////////////////////////////////yH5BAEAAB8ALAAAAAAWABYAAAWN4CeOZGmeaKqubGsusPvBSyFJjVDs6nJLB0khR4AkBCmfsCGBQAoCwjF5gwquVykSFbwZE+AwIBV0GhFog2EwIDchjwRiQo9E2Fx4XD5R+B0DDAEnBXBhBhN2DgwDAQFjJYVhCQYRfgoIDGiQJAWTCQMRiwwMfgicnVcAAAMOaK+bLAOrtLUyt7i5uiUhADs=" />
    <select id="HTML_select" class="intLink">
      <option selected>- HTML element -</option>
      <option value="title">&lt;title&gt;</option>
      <option value="grid">&lt;grid&gt;</option>
      <option value="div">&lt;div&gt;</option>
      <option value="span">&lt;span&gt;</option>
      <option value="p">&lt;p&gt;</option>
      <option value="table">&lt;table&gt;</option>
      <option value="tr">&lt;tr&gt;</option>
      <option value="td">&lt;td&gt;</option>
    </select>
    <img class="intLink extra" title="Delete indentation" id="outdent" src="data:image/gif;base64,R0lGODlhFgAWAMIHAAAAADljwliE35GjuaezxtDV3NHa7P///yH5BAEAAAcALAAAAAAWABYAAAM2eLrc/jDKCQG9F2i7u8agQgyK1z2EIBil+TWqEMxhMczsYVJ3e4ahk+sFnAgtxSQDqWw6n5cEADs=" />
    <img class="intLink extra" title="Add indentation" id="indent" src="data:image/gif;base64,R0lGODlhFgAWAOMIAAAAADljwl9vj1iE35GjuaezxtDV3NHa7P///////////////////////////////yH5BAEAAAgALAAAAAAWABYAAAQ7EMlJq704650B/x8gemMpgugwHJNZXodKsO5oqUOgo5KhBwWESyMQsCRDHu9VOyk5TM9zSpFSr9gsJwIAOw==" />

  </div>
  <div id="sourceBox" contenteditable="true"></div>
`;

export default class YicSourceEditor extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this._shadowRoot.querySelector('#HTML_select').addEventListener("change", this.insertElement.bind(this));

    this._shadowRoot.querySelector('#undo').addEventListener("click", this.clickUndo.bind(this));
    this._shadowRoot.querySelector('#redo').addEventListener("click", this.clickRedo.bind(this));
    this._shadowRoot.querySelector('#outdent').addEventListener("click", this.clickOutdent.bind(this));
    this._shadowRoot.querySelector('#indent').addEventListener("click", this.clickIndent.bind(this));
    this._shadowRoot.querySelector('#cut').addEventListener("click", this.clickCut.bind(this));
    this._shadowRoot.querySelector('#copy').addEventListener("click", this.clickCopy.bind(this));
    this._shadowRoot.querySelector('#paste').addEventListener("click", this.clickPaste.bind(this));

    this.oDoc = this._shadowRoot.querySelector('#sourceBox');
    this.oDoc.addEventListener("input", this.handleChange.bind(this));
  }

  handleChange(e) {
    this.dispatchEvent(new CustomEvent('change', {detail: {value: this.oDoc.innerHTML }}));
  }

  connectedCallback() {
  }

  static get observedAttributes() {
    return ['data'];
  }

  attributeChangedCallback(name, oldValue, newValue) {
    this.oDoc.innerHTML = newValue;
  }

  clickUndo(e) { this.formatDoc('undo'); }
  clickRedo(e) { this.formatDoc('redo'); }
  clickOutdent(e) { this.formatDoc('outdent'); }
  clickIndent(e) { this.formatDoc('indent'); }
  clickCut(e) { this.formatDoc('cut'); }
  clickCopy(e) { this.formatDoc('copy'); }
  clickPaste(e) { this.formatDoc('paste'); }

  insertElement(e) {
    let sel = window.getSelection().toString();
    let tag = e.target[e.target.selectedIndex].value;
    this.formatDoc('insertText','<'+tag+'>'+sel+'</'+tag+'>');
    e.target.selectedIndex=0;
  }

  formatDoc(sCmd, sValue) {
    document.execCommand(sCmd, false, sValue);
  }
}

window.customElements.define('yic-source-editor', YicSourceEditor);
