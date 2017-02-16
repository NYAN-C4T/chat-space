$(function () {
  $('.main-footer__button--send').on('click', function (event) {
    event.preventDefault();
    var textArea = $('.main-footer__input');
    var keyword = textArea.val();

    $.ajax({
      type: 'POST',
      url: 'messages',
      data: {
        message: {
          body: keyword
        }
      },
      dataType: 'json'
    })
      .done(function (data) {
        $('.main-posts').append(
          "<li class='main-post'>" +
            "<div class='main-post__header'>" +
              "<p class='main-post__header main-post__name'>" + data.name +
              "<p class='main-post__header main-post__time'>" + data.created_at +
            "<div class='main-post__body'>" +
              "<p class='main-post__body main-post__text'>" + data.body
        );
        textArea.val('');
      })
      .fail(function () {
        window.alert('error!!');
      });
  });
});
