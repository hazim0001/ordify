import consumer from "./consumer";

const initKitchenOrderCable = () => {
  const orderContainers = document.querySelectorAll('#order');
  if (orderContainers){
    orderContainers.forEach(order => {
      const id = order.dataset.kitchenOrderId
      consumer.subscriptions.create({ channel: "KitchenOrderChannel", id: id }, {
        received(data) {
          const table = document.querySelector(`[data-kitchen-order-id='${data.match(/\d/)[0]}']`);
          table.insertAdjacentHTML('beforeend', data)
        };
      });
    });
  };
};

export { initKitchenOrderCable };
