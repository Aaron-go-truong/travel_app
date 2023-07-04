// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "@fortawesome/fontawesome-free/css/all.css";
import "@tabler/core/dist/js/tabler.min";
import "@tabler/core/dist/css/tabler.min.css";
import 'bootstrap-table'

import "@/channels";
import "@/controllers";
import "@/styles/index.sass";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
require.context('@/images', true);
