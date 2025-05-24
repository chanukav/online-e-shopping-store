<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="create.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payment update</title>
</head>
<body>
    <div class="card-form-container">
        <h2 class="form-title">Edit card details</h2>
        
         <div class="card-icons">
            <img src="${pageContext.request.contextPath}/image/discover.jpg" alt="Visa" class="card-icon">
            <img src="${pageContext.request.contextPath}/image/master.png" alt="MasterCard" class="card-icon">
            <img src="${pageContext.request.contextPath}/image/amex.png" alt="Amex" class="card-icon">
            <img src="${pageContext.request.contextPath}/image/discover.jpg" alt="Discover" class="card-icon">
            <img src="${pageContext.request.contextPath}/image/jcb.png" alt="JCB" class="card-icon">
        </div>>
 
 <!-- input area -->       
        <%
	        String num=request.getParameter("num");
	    	String name=request.getParameter("name");
	    	String month=request.getParameter("month");
	    	String year=request.getParameter("year");
	    	String cv=request.getParameter("cv");
        %>
        
        <form method="post" action="updateCard" id="cardForm">
            <div class="form-group">
                <label for="cardNumber">Card number</label>
                <input type="text" id="cardNumber" name="cardNumber" 
                       value="${param.num}" maxlength="19" readonly required >
            </div>
            
            <div class="form-group">
                <label for="cardName">Holder's name</label>
                <input type="text" id="cardName" name="cardName" 
                       value="${param.name}" required>
            </div>
            
            <div class="form-group">
                <div class="expiry-cvv-row">
                    <div class="expiry-group">
                        <div style="flex: 1;">
                            <label for="expMonth">MM</label>
                            <select id="expMonth" name="expMonth" value="${param.month}" required>
                                <option value="">Month</option>
                                <% for(int i=1;i<=12;i++){ %>
                                    <option value="<%=String.format("%02d", i)%>" <%= (String.format("%02d", i).equals(month) ? "selected" : "") %>>
									    <%=String.format("%02d", i)%>
									</option>
                                <% } %>
                            </select>
                        </div>
                        <div style="flex: 1;">
                            <label for="expYear">YY</label>
                            <select id="expYear" name="expYear" value="${param.year}" required>
                                <option value="">Year</option>
                                <% 
                                    int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
                                    for(int i=currentYear;i<=currentYear+10;i++){ 
                                %>
                                    <option value="<%=String.format("%02d", i%100)%>" <%= (String.format("%02d", i%100).equals(year) ? "selected" : "") %>>
									    <%=String.format("%02d", i%100)%>
									</option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    
                    <div class="cvv-group">
					    <label for="cvv">CVV</label>
					    <div class="cvv-input-wrapper">
					        <input type="password" id="cvv" name="cvv"
					               value="${param.cv}" maxlength="4" required>
					        <i class="fa-solid fa-eye toggle-icon" id="toggleCvv"></i>
					    </div>
					</div>

                </div>
            </div>
            
            <div class="info-text">
                Your card details are encrypted and securely processed to ensure maximum protection during payment with Gamu.pay
            </div>
            
            <button type="submit" class="save-btn">Update</button>
        </form>
    </div> 

    <script>
        // Wait for DOM to load completely
        document.addEventListener('DOMContentLoaded', function() {
            // Format card number with spaces
            document.getElementById('cardNumber').addEventListener('input', function(e) {
                let value = this.value.replace(/\D/g, '');
                value = value.replace(/(\d{4})(?=\d)/g, '$1 ');
                this.value = value.trim();
            });

         // Form validation
            document.getElementById('cardForm').addEventListener('submit', function(e) {
                e.preventDefault();
                
                const cardNumber = document.getElementById('cardNumber').value.replace(/\s+/g, '');
                const cardName = document.getElementById('cardName').value.trim();
                const expMonth = document.getElementById('expMonth').value;
                const expYear = document.getElementById('expYear').value;
                const cvv = document.getElementById('cvv').value.trim();

                if (!cardNumber || cardNumber.length < 16) {
                    alert('Please enter a valid 16-digit card number');
                    return false;
                }

                if (!cardName) {
                    alert('Please enter the name on card');
                    return false;
                }

                if (!expMonth || !expYear) {
                    alert('Please select expiration date');
                    return false;
                }

                // Check for expiration date
                const now = new Date();
                const selectedDate = new Date();
                selectedDate.setFullYear(parseInt("20" + expYear, 10), parseInt(expMonth) - 1, 1); // Set to 1st of the month

                const currentMonth = now.getMonth();
                const currentYear = now.getFullYear();

                if (
                    parseInt("20" + expYear, 10) < currentYear ||
                    (parseInt("20" + expYear, 10) === currentYear && parseInt(expMonth) <= currentMonth)
                ) {
                    alert('The selected expiration date is in the past. Please choose a valid date.');
                    return false;
                }

                if (!cvv || (cvv.length !== 3 && cvv.length !== 4)) {
                    alert('Please enter a valid CVV (3 or 4 digits)');
                    return false;
                }

                this.submit();
            });

        });
        
     // Toggle CVV visibility
        document.getElementById('toggleCvv').addEventListener('click', function () {
            const cvvInput = document.getElementById('cvv');
            const isPassword = cvvInput.type === 'password';
            cvvInput.type = isPassword ? 'text' : 'password';
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });

    </script>
</body>
</html>