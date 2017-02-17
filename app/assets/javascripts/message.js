$(function () {
  let $msgForm = $('#main-footer__form-content');

  function createHTML (name, time, body) {
    let html = "<li class='main-post'>" +
                "<div class='main-post__header'>" +
                  `<p class='main-post__header main-post__name'>${name}` +
                  `<p class='main-post__header main-post__time'>${time}` +
                "<div class='main-post__body'>" +
                  `<p class='main-post__body main-post__text'>${body}`;
    return html;
  }

  $msgForm.on('submit', function (event) {
    event.preventDefault();
    let $textArea = $('.main-footer__input');
    let msgText = $textArea.val();

    $.ajax({
      type: 'POST',
      url: 'messages',
      data: {
        message: {
          body: msgText
        }
      },
      dataType: 'json'
    })
      .done(function (data) {
        $('.main-posts').append(
          createHTML(data.name, data.created_at, data.body)
        );
        $msgForm[0].reset();
        $('.main-footer__button--send').attr('disabled', false);
      })
      .fail(function () {
        window.alert('error!!');
      });
  });
});
