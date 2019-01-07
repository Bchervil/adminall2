// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  if ($('body.students.index').length == 0) {
    return;
  }
  $('.delete-student').click(function(e){
    e.preventDefault();
    let deletionUrl = e.target.getAttribute('href');
    $.ajax({
      method: 'DELETE',
      url: deletionUrl,
      success: function(data) {
        $(e.target).parents('.student-div').remove();
        toastr.success('Student has been successfully deleted.');
      }
    })
  });

});
