import consumer from "./consumer";

const initKitchenOrderCable = () => {
  const orderContainer = document.getElementById('order');
  if (orderContainer) {
    const id = orderContainer.dataset.kitchenOrderId;

    consumer.subscriptions.create({ channel: "KitchenOrderChannel", id: id }, {
      received(data) {
        orderContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initKitchenOrderCable };
