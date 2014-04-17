$(document).ready(function() {
  $('.change-type').click(function() {
    var type = $(this).data('type');

    $('#content_discussion_form_type').attr('value', type);

    if(type === 'Code' || type === 'Video') {
      $('#content-form-subject').html('<input id="content_discussion_form_subject" name="content_discussion_form[subject]" type="text">');
    } else {
      $('#content-form-subject').html('<input id="content_discussion_form_subject" name="content_discussion_form[subject]" type="file">');
    }

    if(type === 'Video') {
      $('#content_discussion_form_subject').attr('placeholder', 'Enter Youtube URL');
    }

    if(type === 'Code') {
      $('#content_discussion_form_subject').attr('placeholder', 'Enter Gist URL');
    }
  });
});
