import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['alert'];

  alertTargetConnected(currentAlert) {
    const alert = bootstrap.Alert
      .getOrCreateInstance(currentAlert);

    setTimeout(() => {
      alert.close();
    }, 3000);
  }
}
