// Modal element references
const modal = document.getElementById('productModal');
const modalImage = document.getElementById('modalImage');
const modalName = document.getElementById('modalName');
const modalCategory = document.getElementById('modalCategory');
const modalDescription = document.getElementById('modalDescription');
const modalAvailability = document.getElementById('modalAvailability');
const modalPrice = document.getElementById('modalPrice');
const modalClose = document.getElementById('modalClose');
const modalBuyPid = document.getElementById('modalBuyPid');
const modalCartProductId = document.getElementById('modalCartProductId');
const modalCartProductName = document.getElementById('modalCartProductName');
const modalCartProductPrice = document.getElementById('modalCartProductPrice');

// Event delegation for modal opening
document.addEventListener('click', function (e) {
  const trigger = e.target.closest('.open-modal');
  if (!trigger) return;

  modalImage.src = trigger.dataset.img;
  modalName.textContent = trigger.dataset.name;
  modalCategory.innerHTML = "<strong>Category:</strong> " + trigger.dataset.category;
  modalDescription.innerHTML = "<strong>Description:</strong> " + trigger.dataset.description;
  modalAvailability.innerHTML = "<strong>Availability:</strong> " + trigger.dataset.availability;
  modalPrice.textContent = trigger.dataset.price;
  modalBuyPid.value = trigger.dataset.pid;
  modalCartProductId.value = trigger.dataset.pid;
  modalCartProductName.value = trigger.dataset.name;
  modalCartProductPrice.value = trigger.dataset.price.replace('Rs. ', '').replace('/=', '');

  modal.style.display = 'flex';
});

// Event delegation for Add to Cart from icon (quick add)
document.addEventListener('click', function (e) {
  const cartIcon = e.target.closest('.cart-icon-product');
  if (!cartIcon) return;

  const card = cartIcon.closest('.Route-card');
  const trigger = card ? card.querySelector('.open-modal') : null;
  if (!trigger) return;

  const pid = trigger.dataset.pid;
  const name = trigger.dataset.name;
  let price = trigger.dataset.price || '';
  price = price.replace('Rs.', '').replace('Rs', '').replace('/=', '').trim();

  const form = document.createElement('form');
  form.method = 'POST';
  form.action = (window.appContextPath || '') + '/AddToCart';

  const idInput = document.createElement('input');
  idInput.type = 'hidden';
  idInput.name = 'productId';
  idInput.value = pid;
  form.appendChild(idInput);

  const nameInput = document.createElement('input');
  nameInput.type = 'hidden';
  nameInput.name = 'productName';
  nameInput.value = name;
  form.appendChild(nameInput);

  const priceInput = document.createElement('input');
  priceInput.type = 'hidden';
  priceInput.name = 'productPrice';
  priceInput.value = price;
  form.appendChild(priceInput);

  const qtyInput = document.createElement('input');
  qtyInput.type = 'hidden';
  qtyInput.name = 'quantity';
  qtyInput.value = '1';
  form.appendChild(qtyInput);

  document.body.appendChild(form);
  form.submit();
});

// Close modal button
modalClose.addEventListener('click', () => {
  modal.style.display = 'none';
});

// Close modal when clicking outside modal content
window.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.style.display = 'none';
  }
});
