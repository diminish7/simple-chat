import consumer from './consumer';

jQuery(($) => {
  let channel = null;

  function createChannel() {
    const roomId = $('#conversation').data('room');
    if (!roomId) return;

    $('#get-name-modal').modal('show');
    $('#get-name-modal input').focus();

    channel = consumer.subscriptions.create({ channel: 'RoomChannel', room_id: roomId }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        const $tableBody = $('#conversation > tbody');

        $tableBody.find('#no-messages').remove();

        const $newRow = $('<tr>');
        const $from = $('<td>');
        $from.text(data['from']);
        $newRow.append($from);

        const $content = $('<td>');
        $content.text(data['content']);
        $newRow.append($content);

        $tableBody.append($newRow);

        const $textarea = $('#content-fields textarea');
        $textarea.val('');
        $textarea.focus();
      },
    });
  }

  function getUser() {
    return $('#conversation').data('name');
  }

  function saveName(e) {
    const $modal = $(e.target).closest('.modal');
    const $input = $modal.find('input[type=text]');

    if ($input.val() === '') {
      $modal.find('#no-name-error').show();
    } else {
      $modal.find('#no-name-error').hide();
      $('#conversation').data('name', $input.val());
      $('#get-name-modal').modal('hide');
      $('#content-fields textarea').focus();
    }
  }

  function sendMessage(e) {
    const $container = $(e.target).parents('#content-fields');
    const $textarea = $container.find('textarea');
    const content = $textarea.val();

    if (content === '') {
      $container.find('#no-message-error').show();
    } else {
      $container.find('#no-message-error').hide();
      channel.send({ from: getUser(), content: content });
    }
  }

  createChannel();

  $(document).on('turbolinks:load', createChannel);
  $(document).on('click', '#save-name-button', saveName);
  $(document).on('keypress', '#get-name-modal input', (e) => {
    if (e.which === 13) saveName(e);
  });
  $(document).on('click', '#content-button', sendMessage);
});
