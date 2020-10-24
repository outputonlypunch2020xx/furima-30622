import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<a href="/users/">${data.user.nickname}</a>：<a>${data.content.text}</a>`;
    console.log(html)
    const messages = document.getElementById('comment-box')
    console.log(messages)
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
