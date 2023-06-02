import $ from 'jquery';

$(() =>{
  initialPage();

  $('#email-edit-button').on('click', () => {
    showInput('email');
  })

  $('#email-tool-cancel').on('click', () => {
    hideInput('email');
  })
  
  $('#fullname-edit-button').on('click', () => {
    showInput('fullname');
  })

  $('#fullname-tool-cancel').on('click', () => {
    hideInput('fullname');
  })

  $('#birthday-edit-button').on('click', () => {
    showInput('birthday');
  })

  $('#birthday-tool-cancel').on('click', () => {
    hideInput('birthday');
  })
  
  $('input.floatNumber').on('input', function() {
    this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');
  });

  $('#gender-edit-button').on('click', () => {
    showInput('gender');
  })

  $('#gender-tool-cancel').on('click', () => {
    hideInput('gender');
  })

  $('#address-edit-button').on('click', () => {
    showInput('address');
  })

  $('#address-tool-cancel').on('click', () => {
    hideInput('address');
  })

  $('#reset-button').on('click', () => {
    $('#reset-button').hide();
    $('#reset-tool').show();
  })

  $('#reset-cancel').on('click', () => {
    $('#reset-button').show();
    $('#reset-tool').hide();
  })

  $('#delete-button').on('click', () => {
    $('#delete-button').hide();
    $('#delete-tool').show();
  })

  $('#delete-cancel').on('click', () => {
    $('#delete-button').show();
    $('#delete-tool').hide();
  })

  $('#security-page').on('click', () => {
    $('#security').show();
    $('#person-details').hide();
  })

  $('#person-details-page').on('click', () => {
    $('#security').hide();
    $('#person-details').show();
  })

  $('#fullname-tool-save').on('click', () => {
    $.ajax({
      type: 'PATCH',
      url: '/users/edit_fullname',
      dataType: 'html',
      data: {full_name:'TCH'},
      success(data) {
        alert(data.id);
        return false;
      },
      error(data) {
        return false;
      }
    })
  })
}
);

function initialPage(){
  $('#security').hide()
  hideToolandInput('fullname')
  hideToolandInput('birthday')
  hideToolandInput('gender')
  hideToolandInput('address')
  hideToolandInput('reset')
  hideToolandInput('delete')
  hideToolandInput('email')
}

function hideToolandInput(id){
  $('#'+id+'-tool').hide();
  $('#'+id+'-input').hide(); 
}

function showInput(id){
  $('#'+id+'-edit-button').hide();
  $('#'+id).hide();
  $('#'+id+'-tool').show();
  $('#'+id+'-input').show();
}

function hideInput(id){
  $('#'+id+'-tool').hide();
  $('#'+id+'-input').hide();
  $('#'+id+'-edit-button').show();
  $('#'+id+'').show();
}