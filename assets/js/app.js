// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import YicNav from "./nav"
import YICContentType from "./yic-content-type"
import YICContentElement from "./yic-content-element"
import YICSourceEditor from "./yic-source-editor"
import YICFunctionalElement from "./yic-functional-element"

let navBar = new YicNav();
