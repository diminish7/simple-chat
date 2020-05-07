import consumer from './consumer';

jQuery(($) => {
  const id = $('#conversation').data('id');

  function saveName(e) {
    const $modal = $(e.target).closest('.modal');
    const $input = $modal.find('input[type=text]');

    if ($input.val() === '') {
      $modal.find('#no-name-error').show();
    } else {
      $modal.find('#no-name-error').hide();
      $('#conversation').data('name', $input.val());
      $('#get-name-modal').modal('hide');
    }
  }

  consumer.subscriptions.create({ channel: 'RoomChannel', id }, {
    connected() {
      // Called when the subscription is ready for use on the server
      $('#get-name-modal').modal('show');
      $('#get-name-modal input').focus();
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) { // eslint-disable-line no-unused-vars
      // Called when there's incoming data on the websocket for this channel
      // TODO: Remove ESLint comment once implemented
    },
  });

  $(document).on('click', '#save-name-button', saveName);
  $(document).on('keypress', '#get-name-modal input', (e) => {
    if (e.which === 13) saveName(e);
  });
});
