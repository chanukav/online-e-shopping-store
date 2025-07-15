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

// Event delegation for Add to Cart from icon
document.addEventListener('click', function (e) {
  const cartIcon = e.target.closest('.cart-icon-product');
  if (!cartIcon) return;

  const pid = cartIcon.dataset.pid;
  fetch('AddToCartServlet', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: 'pid=' + encodeURIComponent(pid)
  })
  .then(response => response.text())
  .then(data => alert('Product added to cart!'))
  .catch(error => {
    alert('Error adding to cart!');
    console.error('Error:', error);
  });
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
