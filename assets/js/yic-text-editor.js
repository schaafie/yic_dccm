const template = document.createElement('template');
template.innerHTML = `
  <style type="text/css">
    :host {
      display: block;
      font-family: sans-serif;
      text-align: left;
    }
    .intLink {
      cursor: pointer;
    }
    img.intLink {
      border: 0;
    }
    .hidden {
      display: none;
    }
    #toolBar1 select {
      font-size:10px;
    }
    #textBox {
      width: 100%;
      border: 1px #000000 solid;
    }
    #textBox.singlerow {
      height: 3rem;
    }
    #textBox.multirow {
      height: 20rem;
      overflow: scroll;
    }
    #textBox #sourceText {
      padding: 0;
      margin: 0;
      min-width: 498px;
      min-height: 200px;
    }
    #editMode label {
      cursor: pointer;
    }
  </style>

  <div id="toolBar1" class="full">
    <select id="format_select">
      <option selected>- formatting -</option>
      <option value="h1">Title 1 &lt;h1&gt;</option>
      <option value="h2">Title 2 &lt;h2&gt;</option>
      <option value="h3">Title 3 &lt;h3&gt;</option>
      <option value="h4">Title 4 &lt;h4&gt;</option>
      <option value="h5">Title 5 &lt;h5&gt;</option>
      <option value="h6">Subtitle &lt;h6&gt;</option>
      <option value="p">Paragraph &lt;p&gt;</option>
      <option value="pre">Preformatted &lt;pre&gt;</option>
    </select>
    <select id="font_select">
      <option class="heading" selected>- font -</option>
      <option>Arial</option>
      <option>Arial Black</option>
      <option>Courier New</option>
      <option>Times New Roman</option>
    </select>
    <select id="size_select">
      <option class="heading" selected>- size -</option>
      <option value="1">Very small</option>
      <option value="2">A bit small</option>
      <option value="3">Normal</option>
      <option value="4">Medium-large</option>
      <option value="5">Big</option>
      <option value="6">Very big</option>
      <option value="7">Maximum</option>
    </select>
    <select id="color_select">
      <option class="heading" selected>- color -</option>
      <option value="red">Red</option>
      <option value="blue">Blue</option>
      <option value="green">Green</option>
      <option value="black">Black</option>
    </select>
    <select id="bgcolor_select">
      <option class="heading" selected>- background -</option>
      <option value="red">Red</option>
      <option value="green">Green</option>
      <option value="black">Black</option>
    </select>
  </div>
  <div id="toolBar2">
    <img class="intLink basic" title="Clean" id="clean" src="data:image/gif;base64,R0lGODlhFgAWAIQbAD04KTRLYzFRjlldZl9vj1dusY14WYODhpWIbbSVFY6O7IOXw5qbms+wUbCztca0ccS4kdDQjdTLtMrL1O3YitHa7OPcsd/f4PfvrvDv8Pv5xv///////////////////yH5BAEKAB8ALAAAAAAWABYAAAV84CeOZGmeaKqubMteyzK547QoBcFWTm/jgsHq4rhMLoxFIehQQSAWR+Z4IAyaJ0kEgtFoLIzLwRE4oCQWrxoTOTAIhMCZ0tVgMBQKZHAYyFEWEV14eQ8IflhnEHmFDQkAiSkQCI2PDC4QBg+OAJc0ewadNCOgo6anqKkoIQA7" />
    <img class="intLink basic" title="Undo" id="undo" src="data:image/gif;base64,R0lGODlhFgAWAOMKADljwliE33mOrpGjuYKl8aezxqPD+7/I19DV3NHa7P///////////////////////yH5BAEKAA8ALAAAAAAWABYAAARR8MlJq7046807TkaYeJJBnES4EeUJvIGapWYAC0CsocQ7SDlWJkAkCA6ToMYWIARGQF3mRQVIEjkkSVLIbSfEwhdRIH4fh/DZMICe3/C4nBQBADs=" />
    <img class="intLink basic" title="Redo" id="redo" src="data:image/gif;base64,R0lGODlhFgAWAMIHAB1ChDljwl9vj1iE34Kl8aPD+7/I1////yH5BAEKAAcALAAAAAAWABYAAANKeLrc/jDKSesyphi7SiEgsVXZEATDICqBVJjpqWZt9NaEDNbQK1wCQsxlYnxMAImhyDoFAElJasRRvAZVRqqQXUy7Cgx4TC6bswkAOw==" />
    <img class="intLink basic" title="Remove formatting" id="removeFormat" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAABGdBTUEAALGPC/xhBQAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAAOxAAADsQBlSsOGwAAAAd0SU1FB9oECQMCKPI8CIIAAAAIdEVYdENvbW1lbnQA9syWvwAAAuhJREFUOMtjYBgFxAB501ZWBvVaL2nHnlmk6mXCJbF69zU+Hz/9fB5O1lx+bg45qhl8/fYr5it3XrP/YWTUvvvk3VeqGXz70TvbJy8+Wv39+2/Hz19/mGwjZzuTYjALuoBv9jImaXHeyD3H7kU8fPj2ICML8z92dlbtMzdeiG3fco7J08foH1kurkm3E9iw54YvKwuTuom+LPt/BgbWf3//sf37/1/c02cCG1lB8f//f95DZx74MTMzshhoSm6szrQ/a6Ir/Z2RkfEjBxuLYFpDiDi6Af///2ckaHBp7+7wmavP5n76+P2ClrLIYl8H9W36auJCbCxM4szMTJac7Kza////R3H1w2cfWAgafPbqs5g7D95++/P1B4+ECK8tAwMDw/1H7159+/7r7ZcvPz4fOHbzEwMDwx8GBgaGnNatfHZx8zqrJ+4VJBh5CQEGOySEua/v3n7hXmqI8WUGBgYGL3vVG7fuPK3i5GD9/fja7ZsMDAzMG/Ze52mZeSj4yu1XEq/ff7W5dvfVAS1lsXc4Db7z8C3r8p7Qjf///2dnZGxlqJuyr3rPqQd/Hhyu7oSpYWScylDQsd3kzvnH738wMDzj5GBN1VIWW4c3KDon7VOvm7S3paB9u5qsU5/x5KUnlY+eexQbkLNsErK61+++VnAJcfkyMTIwffj0QwZbJDKjcETs1Y8evyd48toz8y/ffzv//vPP4veffxpX77z6l5JewHPu8MqTDAwMDLzyrjb/mZm0JcT5Lj+89+Ybm6zz95oMh7s4XbygN3Sluq4Mj5K8iKMgP4f0////fv77//8nLy+7MCcXmyYDAwODS9jM9tcvPypd35pne3ljdjvj26+H2dhYpuENikgfvQeXNmSl3tqepxXsqhXPyc666s+fv1fMdKR3TK72zpix8nTc7bdfhfkEeVbC9KhbK/9iYWHiErbu6MWbY/7//8/4//9/pgOnH6jGVazvFDRtq2VgiBIZrUTIBgCk+ivHvuEKwAAAAABJRU5ErkJggg==">
    <img class="intLink basic" title="Bold" id="bold" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAInhI+pa+H9mJy0LhdgtrxzDG5WGFVk6aXqyk6Y9kXvKKNuLbb6zgMFADs=" />
    <img class="intLink basic" title="Italic" id="italic" src="data:image/gif;base64,R0lGODlhFgAWAKEDAAAAAF9vj5WIbf///yH5BAEAAAMALAAAAAAWABYAAAIjnI+py+0Po5x0gXvruEKHrF2BB1YiCWgbMFIYpsbyTNd2UwAAOw==" />
    <img class="intLink basic" title="Underline" id="underline" src="data:image/gif;base64,R0lGODlhFgAWAKECAAAAAF9vj////////yH5BAEAAAIALAAAAAAWABYAAAIrlI+py+0Po5zUgAsEzvEeL4Ea15EiJJ5PSqJmuwKBEKgxVuXWtun+DwxCCgA7" />
    <img class="intLink extra" title="Left align" id="justifyleft" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIghI+py+0Po5y02ouz3jL4D4JMGELkGYxo+qzl4nKyXAAAOw==" />
    <img class="intLink extra" title="Center align" id="justifycenter" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIfhI+py+0Po5y02ouz3jL4D4JOGI7kaZ5Bqn4sycVbAQA7" />
    <img class="intLink extra" title="Right align" id="justifyright" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIghI+py+0Po5y02ouz3jL4D4JQGDLkGYxouqzl43JyVgAAOw==" />
    <img class="intLink extra" title="Numbered list" id="insertorderedlist" src="data:image/gif;base64,R0lGODlhFgAWAMIGAAAAADljwliE35GjuaezxtHa7P///////yH5BAEAAAcALAAAAAAWABYAAAM2eLrc/jDKSespwjoRFvggCBUBoTFBeq6QIAysQnRHaEOzyaZ07Lu9lUBnC0UGQU1K52s6n5oEADs=" />
    <img class="intLink extra" title="Dotted list" id="insertunorderedlist" src="data:image/gif;base64,R0lGODlhFgAWAMIGAAAAAB1ChF9vj1iE33mOrqezxv///////yH5BAEAAAcALAAAAAAWABYAAAMyeLrc/jDKSesppNhGRlBAKIZRERBbqm6YtnbfMY7lud64UwiuKnigGQliQuWOyKQykgAAOw==" />
    <img class="intLink extra" title="Quote" id="blockquote" src="data:image/gif;base64,R0lGODlhFgAWAIQXAC1NqjFRjkBgmT9nqUJnsk9xrFJ7u2R9qmKBt1iGzHmOrm6Sz4OXw3Odz4Cl2ZSnw6KxyqO306K63bG70bTB0rDI3bvI4P///////////////////////////////////yH5BAEKAB8ALAAAAAAWABYAAAVP4CeOZGmeaKqubEs2CekkErvEI1zZuOgYFlakECEZFi0GgTGKEBATFmJAVXweVOoKEQgABB9IQDCmrLpjETrQQlhHjINrTq/b7/i8fp8PAQA7" />
    <img class="intLink extra" title="Delete indentation" id="outdent" src="data:image/gif;base64,R0lGODlhFgAWAMIHAAAAADljwliE35GjuaezxtDV3NHa7P///yH5BAEAAAcALAAAAAAWABYAAAM2eLrc/jDKCQG9F2i7u8agQgyK1z2EIBil+TWqEMxhMczsYVJ3e4ahk+sFnAgtxSQDqWw6n5cEADs=" />
    <img class="intLink extra" title="Add indentation" id="indent" src="data:image/gif;base64,R0lGODlhFgAWAOMIAAAAADljwl9vj1iE35GjuaezxtDV3NHa7P///////////////////////////////yH5BAEAAAgALAAAAAAWABYAAAQ7EMlJq704650B/x8gemMpgugwHJNZXodKsO5oqUOgo5KhBwWESyMQsCRDHu9VOyk5TM9zSpFSr9gsJwIAOw==" />
    <img class="intLink full" title="Hyperlink" id="createlink" src="data:image/gif;base64,R0lGODlhFgAWAOMKAB1ChDRLY19vj3mOrpGjuaezxrCztb/I19Ha7Pv8/f///////////////////////yH5BAEKAA8ALAAAAAAWABYAAARY8MlJq7046827/2BYIQVhHg9pEgVGIklyDEUBy/RlE4FQF4dCj2AQXAiJQDCWQCAEBwIioEMQBgSAFhDAGghGi9XgHAhMNoSZgJkJei33UESv2+/4vD4TAQA7" />
    <img class="intLink extra" title="Cut" id="cut" src="data:image/gif;base64,R0lGODlhFgAWAIQSAB1ChBFNsRJTySJYwjljwkxwl19vj1dusYODhl6MnHmOrpqbmpGjuaezxrCztcDCxL/I18rL1P///////////////////////////////////////////////////////yH5BAEAAB8ALAAAAAAWABYAAAVu4CeOZGmeaKqubDs6TNnEbGNApNG0kbGMi5trwcA9GArXh+FAfBAw5UexUDAQESkRsfhJPwaH4YsEGAAJGisRGAQY7UCC9ZAXBB+74LGCRxIEHwAHdWooDgGJcwpxDisQBQRjIgkDCVlfmZqbmiEAOw==" />
    <img class="intLink extra" title="Copy" id="copy" src="data:image/gif;base64,R0lGODlhFgAWAIQcAB1ChBFNsTRLYyJYwjljwl9vj1iE31iGzF6MnHWX9HOdz5GjuYCl2YKl8ZOt4qezxqK63aK/9KPD+7DI3b/I17LM/MrL1MLY9NHa7OPs++bx/Pv8/f///////////////yH5BAEAAB8ALAAAAAAWABYAAAWG4CeOZGmeaKqubOum1SQ/kPVOW749BeVSus2CgrCxHptLBbOQxCSNCCaF1GUqwQbBd0JGJAyGJJiobE+LnCaDcXAaEoxhQACgNw0FQx9kP+wmaRgYFBQNeAoGihCAJQsCkJAKOhgXEw8BLQYciooHf5o7EA+kC40qBKkAAAGrpy+wsbKzIiEAOw==" />
    <img class="intLink extra" title="Paste" id="paste" src="data:image/gif;base64,R0lGODlhFgAWAIQUAD04KTRLY2tXQF9vj414WZWIbXmOrpqbmpGjudClFaezxsa0cb/I1+3YitHa7PrkIPHvbuPs+/fvrvv8/f///////////////////////////////////////////////yH5BAEAAB8ALAAAAAAWABYAAAWN4CeOZGmeaKqubGsusPvBSyFJjVDs6nJLB0khR4AkBCmfsCGBQAoCwjF5gwquVykSFbwZE+AwIBV0GhFog2EwIDchjwRiQo9E2Fx4XD5R+B0DDAEnBXBhBhN2DgwDAQFjJYVhCQYRfgoIDGiQJAWTCQMRiwwMfgicnVcAAAMOaK+bLAOrtLUyt7i5uiUhADs=" />
    <img class="intLink extra" title="Code" id="code" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALFSURBVEhLtZRNTxRBEIaregYRAT8gYlCj8aKA8QOW6B6ANXrg4sUDMfwETx7UePFCopEEQzwaf4AXwg/QEAygBiMfhkQOEoIKGkUxYgR2Z5gu35lpN8zOLMREn8Nsd3XXu1XV1c0C6H+wlXAmI3YqJTvCmah0Wpf5tnCejK8ZRMzA2PL4ArbL7azpNLbWuES97NFPy6LrxJQjoTeaaPjFpPpkXPL4msqMY1hZusRabgvJYaT0rtTmX4h7HSF8hWgtxO/C+Y7ZHqNoxK2N+ikEF0XxDbuCFoeGOItYOJ2W7RUub8uJ9OIPOrEn/WxSTRm3gE0jRuXrWWjm+TjNh6I+LKOjam1gnJdF0xhES5SmunAtSlFhUI4arvhiZh5BCS0hTfGYKo0pQqKwf3D4UShQLrTE0Ratos5iKSo3pgiJwji4c1hxPKEPxhRH8TTK4WmhM8YSISbc0iQpxXQPTqPi0KAxx6g9Qu+RUQ+GF1qa9MXC3s53hS+IE3uI9I4jin43x9deTfNnsy8RX0yW5aow3cRBVKLPG0am1FykKywlOYgu4KgWLOYDZWVyoqNDLLOcSDYr1RA9Cb9VCA+sB4cdEuvj82f1PselWxi2K0WXh8fUZLgSJXNKdntK+uG6Cxepc/i1mjFLyX08+FJ9KSG6j+F+rak5tMbRLA0IpwUaTzaK/iGxK9omeA4l0bgkVcYUh3GtBV+mOWOJkCjcRUjOd5LkdR88TkH9sc8LDAUUdYTsd6RaXeyJxKEdwoExXrtvxhSh6COE3nyAPJtFS7eyabbUobfOHvbcVaqzHKmBcBe8ahBua+HTGWgWE25r1PVIsxsC9ZhmSdMVsXkeXo9Q/2p4fIS9Z2RCPQ4cNrCpMJZVJkVV2pVKtqlihXl277J4P3bS0VKhNQeP/sFjvNTXh2tRgK8Zfv4K5LAFvmYQsZn/Q4h+A9S0VpSiQTTWAAAAAElFTkSuQmCC" />
  </div>
  <div id="textBox" contenteditable="true"></div>
`;

export default class YicTextEditor extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
    this._shadowRoot.querySelector('#format_select').addEventListener("change", this.changeFormat.bind(this));
    this._shadowRoot.querySelector('#font_select').addEventListener("change", this.changeFont.bind(this));
    this._shadowRoot.querySelector('#size_select').addEventListener("change", this.changeSize.bind(this));
    this._shadowRoot.querySelector('#color_select').addEventListener("change", this.changeColor.bind(this));
    this._shadowRoot.querySelector('#bgcolor_select').addEventListener("change", this.changeBgColor.bind(this));

    this._shadowRoot.querySelector('#clean').addEventListener("click", this.clickClean.bind(this));
    this._shadowRoot.querySelector('#undo').addEventListener("click", this.clickUndo.bind(this));
    this._shadowRoot.querySelector('#redo').addEventListener("click", this.clickRedo.bind(this));
    this._shadowRoot.querySelector('#removeFormat').addEventListener("click", this.clickRemoveFormat.bind(this));
    this._shadowRoot.querySelector('#bold').addEventListener("click", this.clickBold.bind(this));
    this._shadowRoot.querySelector('#italic').addEventListener("click", this.clickItalic.bind(this));
    this._shadowRoot.querySelector('#underline').addEventListener("click", this.clickUnder.bind(this));
    this._shadowRoot.querySelector('#justifyleft').addEventListener("click", this.clickJL.bind(this));
    this._shadowRoot.querySelector('#justifycenter').addEventListener("click", this.clickJC.bind(this));
    this._shadowRoot.querySelector('#justifyright').addEventListener("click", this.clickJR.bind(this));

    this._shadowRoot.querySelector('#insertorderedlist').addEventListener("click", this.clickOL.bind(this));
    this._shadowRoot.querySelector('#insertunorderedlist').addEventListener("click", this.clickUL.bind(this));
    this._shadowRoot.querySelector('#blockquote').addEventListener("click", this.clickBlockquote.bind(this));
    this._shadowRoot.querySelector('#outdent').addEventListener("click", this.clickOutdent.bind(this));
    this._shadowRoot.querySelector('#indent').addEventListener("click", this.clickIndent.bind(this));
    this._shadowRoot.querySelector('#createlink').addEventListener("click", this.clickLink.bind(this));
    this._shadowRoot.querySelector('#cut').addEventListener("click", this.clickCut.bind(this));
    this._shadowRoot.querySelector('#copy').addEventListener("click", this.clickCopy.bind(this));
    this._shadowRoot.querySelector('#paste').addEventListener("click", this.clickPaste.bind(this));
    this._shadowRoot.querySelector('#code').addEventListener("click", this.flipSwitchMode.bind(this));

    this.oDoc = this._shadowRoot.querySelector('#textBox');
    this.oDoc.addEventListener("input", this.handleChange.bind(this));
    this.sDefTxt = "";
  }

  handleChange(e) {
    this.dispatchEvent(new CustomEvent('change', {detail: {value: this.oDoc.innerHTML }}));
  }

  connectedCallback() {
    this.sDefTxt = this.oDoc.innerHTML;
    this.switchMode = false;
  }

  static get observedAttributes() {
    return ['data','type', 'multi'];
  }

  attributeChangedCallback(name, oldValue, newValue) {
    switch( name ) {
      case 'data':
        this.oDoc.innerHTML = newValue;
        break;
      case 'type':
        let basicList = this._shadowRoot.querySelectorAll('.basic');
        let extraList = this._shadowRoot.querySelectorAll('.extra');
        let fullList = this._shadowRoot.querySelectorAll('.full');
        switch(newValue) {
          case 'basic':
            extraList.forEach((item) => {item.classList.add("hidden");})
            fullList.forEach((item) => {item.classList.add("hidden");})
            break;
          case 'extra':
            extraList.forEach((item) => {item.classList.remove("hidden");})
            fullList.forEach((item) => {item.classList.add("hidden");})
            break;
          case 'full':
            extraList.forEach((item) => {item.classList.remove("hidden");})
            fullList.forEach((item) => {item.classList.remove("hidden");})
            break;
        }
        break;
      case 'multi':
        if (newValue=="true") {
          this.oDoc.classList.remove("singlerow");
          this.oDoc.classList.add("multirow");
        } else {
          this.oDoc.classList.remove("multirow");
          this.oDoc.classList.add("singlerow");
        }
    }
  }

  clickUndo(e) { this.formatDoc('undo'); }
  clickRedo(e) { this.formatDoc('redo'); }
  clickRedo(e) { this.formatDoc('redo'); }
  clickRemoveFormat(e) { this.formatDoc('removeFormat'); }
  clickBold(e) { this.formatDoc('bold'); }
  clickItalic(e) { this.formatDoc('italic'); }
  clickUnder(e) { this.formatDoc('underline'); }
  clickJL(e) { this.formatDoc('justifyleft'); }
  clickJC(e) { this.formatDoc('justifycenter'); }
  clickJR(e) { this.formatDoc('justifyright'); }
  clickOL(e) { this.formatDoc('insertorderedlist'); }
  clickUL(e) { this.formatDoc('insertunorderedlist'); }
  clickBlockquote(e) { this.formatDoc('formatblock','blockquote'); }
  clickOutdent(e) { this.formatDoc('outdent'); }
  clickIndent(e) { this.formatDoc('indent'); }
  clickCut(e) { this.formatDoc('cut'); }
  clickCopy(e) { this.formatDoc('copy'); }
  clickPaste(e) { this.formatDoc('paste'); }

  clickLink(e) {
    var sLnk=prompt('Write the URL here','http:\/\/');
    if (sLnk&&sLnk!=''&&sLnk!='http://') {
      this.formatDoc('',sLnk)
    }
  }

  clickClean(e) {
    if (this.validateMode()&&confirm('Are you sure?')) {
      this.oDoc.innerHTML=""
    };
  }

  changeFormat(e) {
    this.formatDoc('format_select',e.target[e.target.selectedIndex].value);
    e.target.selectedIndex=0;
  }
  changeFont(e) {
    this.formatDoc('fontname',e.target[e.target.selectedIndex].value);
    this.selectedIndex=0;
  }
  changeSize(e) {
    this.formatDoc('fontsize',e.target[e.target.selectedIndex].value);
    e.target.selectedIndex=0;
  }
  changeColor(e) {
    this.formatDoc('forecolor',e.target[e.target.selectedIndex].value);
    e.target.selectedIndex=0;
  }
  changeBgColor(e) {
    this.formatDoc('backcolor',e.target[e.target.selectedIndex].value);
    e.target.selectedIndex=0;
  }

  flipSwitchMode(e) {
    this.switchMode = !this.switchMode;
    this.setDocMode(this.switchMode);
  }

  formatDoc(sCmd, sValue) {
    document.execCommand(sCmd, false, sValue);
  }

  validateMode() {
    if (!this.switchMode) { return true ; }
    alert("Uncheck \"Show HTML\".");
    this.oDoc.focus();
    return false;
  }

  setDocMode(bToSource) {
    var oContent;
    if (bToSource) {
      oContent = document.createTextNode(this.oDoc.innerHTML);
      this.oDoc.innerHTML = "";
      var oPre = document.createElement("pre");
      this.oDoc.contentEditable = false;
      oPre.id = "sourceText";
      oPre.contentEditable = true;
      oPre.appendChild(oContent);
      this.oDoc.appendChild(oPre);
      document.execCommand("defaultParagraphSeparator", false, "div");
    } else {
      if (document.all) {
        oDoc.innerHTML = oDoc.innerText;
      } else {
        oContent = document.createRange();
        oContent.selectNodeContents(this.oDoc.firstChild);
        this.oDoc.innerHTML = oContent.toString();
      }
      this.oDoc.contentEditable = true;
    }
    this.oDoc.focus();
  }
}

window.customElements.define('yic-text-editor', YicTextEditor);
