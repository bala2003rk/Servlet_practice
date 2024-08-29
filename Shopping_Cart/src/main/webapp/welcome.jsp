
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
	<link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 50px auto;
            max-width: 600px;
        }

        h1, h2 {
            color: #343a40;
            text-align: center;
        }

        .product {
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }

        .product span {
            color: #495057;
            display: inline-block;
            margin-right: 10px;
        }

        button {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 8px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        #cart {
            margin-top: 20px;
        }

        #total-price {
            font-weight: bold;
            color: #007bff;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
      <script src="script.js"></script>
</head>
<body>
	
	<%
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.html");
		}
	%>

    <div class="container">
        <h1>Shopping Cart</h1>
        <div id="product-list">
            <div class="product">
                <span>Product Name: Laptop</span>
                <span>Price: $1000</span>
                <button onclick="addItem('Laptop', 1000)">Add to Cart</button>
            </div>
            <div class="product">
                <span>Product Name: Mouse</span>
                <span>Price: $20</span>
                <button onclick="addItem('Mouse', 20)">Add to Cart</button>
            </div>
            <div class="product">
                <span>Product Name: Keyboard</span>
                <span>Price: $50</span>
                <button onclick="addItem('Keyboard', 50)">Add to Cart</button>
            </div>
        </div>
        <h2>Shopping Cart</h2>
        <div id="cart">
            <ul id="cart-items"></ul>
            <p>Total: $<span id="total-price">0</span></p>
            <button onclick="clearCart()">Clear Cart</button>
        </div>
    </div>

    <script>
        let cartItems = [];

        function addItem(name, price) {
            cartItems.push({ name, price });
            updateCart();
        }

        function removeItem(index) {
            cartItems.splice(index, 1);
            updateCart();
        }

        function updateCart() {
            const cartList = document.getElementById('cart-items');
            const totalPrice = document.getElementById('total-price');
            let total = 0;
            cartList.innerHTML = '';
            cartItems.forEach((item, index) => {
                const li = document.createElement('li');
                const itemName = document.createElement('span');
                itemName.textContent = item.name;
                const itemPrice = document.createElement('span');
                itemPrice.textContent = item.price.toFixed(2);
                const removeButton = document.createElement('button');
                removeButton.textContent = 'Remove';
                removeButton.onclick = () => removeItem(index);
                li.appendChild(itemName);
                li.appendChild(document.createTextNode(' - '));
                li.appendChild(itemPrice);
                li.appendChild(removeButton);
                cartList.appendChild(li);
                total += item.price;
            });
            totalPrice.textContent = total;
        }

        function clearCart() {
            cartItems = [];
            updateCart();
        }
    </script>

    <a href="LogoutServlet">Logout</a>
</body>
</html>
