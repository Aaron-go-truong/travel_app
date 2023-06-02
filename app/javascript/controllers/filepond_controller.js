import { Controller } from '@hotwired/stimulus';
import * as FilePond from 'filepond';
import FilePondPluginFilePoster from 'filepond-plugin-file-poster';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';
import FilePondPluginFileValidateSize from 'filepond-plugin-file-validate-size';
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';
import FilePondPluginImageExifOrientation from 'filepond-plugin-image-exif-orientation';

import 'filepond/dist/filepond.min.css';
import 'filepond-plugin-file-poster/dist/filepond-plugin-file-poster.css';
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css';

FilePond.registerPlugin(
  FilePondPluginFilePoster,
  FilePondPluginImagePreview,
  FilePondPluginImageExifOrientation,
  FilePondPluginFileValidateType,
  FilePondPluginFileValidateSize,
);

const baseOptions = {
  storeAsFile: true,
  maxFileSize: '5MB',
  labelIdle: 'Drag & drop here'
};
const avatarExtraOptions = {
  imagePreviewHeight: 200,
  imageCropAspectRatio: '1:1',
  imageResizeTargetWidth: 200,
  imageResizeTargetHeight: 200,
  styleLoadIndicatorPosition: 'center bottom',
  styleButtonRemoveItemPosition: 'center bottom',
  stylePanelLayout: 'compact circle',
}

export default class extends Controller {
  static targets = ['input'];

  inputTargetConnected(inputTarget) {
    this.setupFilePond(inputTarget);
  }

  setupFilePond(inputTarget) {
    let options = { ...baseOptions };
    const { dataset: { styleLayout, files } } = inputTarget;

    if (styleLayout === 'avatar') {
      options = { ...options, ...avatarExtraOptions };
    }

    if (files) {
      options = { ...options, files: JSON.parse(files) };
    }

    const instance = FilePond.create(inputTarget, {
      ...options,
      oninit: () => {
        // prevent submit existing files load from server
        const inputElement = instance.element.querySelector('.filepond--data input');
        inputElement?.remove();
      }
    });
  }
}
