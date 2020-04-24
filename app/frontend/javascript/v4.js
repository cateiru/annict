import 'bootstrap';

import ujs from '@rails/ujs';
import Turbolinks from 'turbolinks';
import Vue from 'vue';

import sidebar from './web/components/sidebar';
import tabBar from './web/components/tabBar';

document.addEventListener('turbolinks:load', (_event) => {
  window.WebFont.load({
    google: {
      families: ['Raleway'],
    },
  });

  Vue.component('c-sidebar', sidebar);
  Vue.component('c-tab-bar', tabBar);

  new Vue({
    el: '.ann-application',
  });
});

ujs.start();
Turbolinks.start();
