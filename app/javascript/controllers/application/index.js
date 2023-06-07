import { Application } from '@hotwired/stimulus';
import { definitionsFromContext } from '@hotwired/stimulus-webpack-helpers';

const application = Application.start();
const context = require.context('./', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
