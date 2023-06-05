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
      data: {full_name: $("#fullname-value").val()},
      success(data) {
        return false;
      },
      error(data) {
        return false;
      }
    }).then(
      $("#fullname").text($("#fullname-value").val()),
      hideInput('fullname')
    )
  })

  $('#birthday-tool-save').on('click', () => {
    let date_of_birth = $('#birthday-day-value').val()+'/'+$('#birthday-month-value').val()+'/'+$('#birthday-year-value').val();
    $.ajax({
      type: 'PATCH',
      url: '/users/edit_dateofbirth',
      dataType: 'html',
      data: {date_of_birth: date_of_birth},
      success(data) {
        return false;
      },
      error(data) {
        return false;
      }
    }).then(
      $("#birthday").text(date_of_birth),
      hideInput('birthday')
    )
  })

  $('#gender-tool-save').on('click', () => { 
    $.ajax({
      type: 'PATCH',
      url: '/users/edit_gender',
      dataType: 'html',
      data: {gender: $('#gender-select').val()},
      success(data) {
        return false;
      },
      error(data) {
        return false;
      }
    }).then(
      $("#gender").text($('#gender-select :selected').text()),
      hideInput('gender')
    )
  })

  $('#address-tool-save').on('click', () => {
    $.ajax({
      type: 'PATCH',
      url: '/users/edit_address',
      dataType: 'html',
      data: {address: $('#address-value').val()},
      success(data) {
        return false;
      },
      error(data) {
        return false;
      }
    }).then(
      $("#address").text($('#address-value').val()),
      hideInput('address')
    )
  }),
  $('#btn-save-avatar').on('click', () => {
    console.log($('#filepond-avatar'))
    // $.ajax({
    //   type: 'PATCH',
    //   url: '/users/edit_address',
    //   dataType: 'html',
    //   data: {address: $('#address-value').val()},
    //   success(data) {
    //     return false;
    //   },
    //   error(data) {
    //     return false;
    //   }
    // }).then(
    //   $("#address").text($('#address-value').val()),
    //   hideInput('address')
    // )
  })
}
);

function initialPage(){
  $('#security').hide()
  // $('#save-avatar').hide()
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