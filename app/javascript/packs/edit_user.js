import $ from 'jquery';

$(() =>{
  initialPage();
  
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

  $('#security-page').on('click', () => {
    $('#security').show();
    $('#person-details').hide();
  })
}
);

function initialPage(){
  $('#security').hide()
  hideToolandInput('fullname')
  hideToolandInput('birthday')
  hideToolandInput('gender')
  hideToolandInput('address')
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