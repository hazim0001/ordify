import consumer from "./consumer";

const initKitchenOrderCable = () => {
  const orderContainers = document.querySelectorAll('#order');
  if (orderContainers){
    orderContainers.forEach(order => {
      const id = order.dataset.kitchenOrderId
      consumer.subscriptions.create({ channel: "KitchenOrderChannel", id: id }, {
        received(data) {
          const table = document.querySelector(`[data-kitchen-order-id='${data.match(/\d/)[0]}']`);
          table.innerHTML = data
          setTimeout(() => {

            var evt = new KeyboardEvent('keypress', {
              'key':'a',
              'code':'KeyA',
              'bubbles': true,
              'cancelable': true,
              'charCode': 97,
              'code': "KeyA",
              'composed': true,
              'isTrusted': true,
              'key': "a",
              'keyCode': 97,
              'metaKey': false,
              'which': 97
            });
            document.dispatchEvent (evt);
          }, 2000);
        }
      });
    });
  };
};

export { initKitchenOrderCable };
