// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as jQuery from "jquery";
window.jQuery = jQuery
window.$ = jQuery

import "./slideshow.js"
import "./checkout.js"
import "./test.js"
