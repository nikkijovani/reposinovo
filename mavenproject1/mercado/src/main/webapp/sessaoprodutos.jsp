
<%@page import="br.edu.iff.mercado.controles.ControleProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<jsp:directive.page import="br.edu.iff.mercado.entidades.*" />
<jsp:directive.page import="java.util.*" />


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="cssdaverdura.css">
        <link rel="stylesheet" type="text/css" href="css\beleza.css">
	<title>Mercearia online</title>
<header>
		   <h2><img	src="imagens /logosite.png" width=155px right=55px alt="Mercearia online" ></h2>
		   <nav class="menu">
				<ul>
						<li><a	href="index.html">Página inicial</a></li>
						<li><a	href="login.html">Login</a></li>
						<li><a	href="cadastro.html">Cadastro</a></li>
                                                
                                           
                                                
            <li><a  href="contato.html">Contato</a>
						<li><a	href="">Sessão de produtos</a>
							
						</li>
				</ul>
		 </nav>
 <link rel="stylesheet" href="css/bootstrap.min.css">
  <style>
  .badge-notify{
    background:red;
    position:relative;
    top: -20px;
    right: 10px;
  }
  .my-cart-icon-affix {
    position: fixed;

  }
  .iconcart{
  	color: white;
  }
  </style>
</header>

<body class="container">

  <div class="page-header">
    <h1>Sessão de produtos
      <div style="float: right; cursor: pointer; color: white;">
        <span class="glyphicon glyphicon-shopping-cart my-cart-icon"><span class="badge badge-notify my-cart-badge"></span></span>
      </div>
    </h1>
  </div>

  <div class="row">
            <%
                List<Produto> lista = ControleProduto.listar();
                request.setAttribute("produtos", lista);
                for(Produto produto : lista) {
                    %>
                    
                    <div>
                        Um produto aqui:<br>
                        <%=produto.getNmNome()%><br>
                        Apenas <%=produto.getVlUnidade()%><br>
                        <%
                        if(produto.getVlPromocao() != null){
                        %>
                        Promoção: <%=produto.getVlPromocao()%><br>
                        <%
                        }
                        %>
                        <button>COMPRAR</button>
                    </div>
                    <br>
                    
                    <%
                }
            %>
            
            <br><br>




        </div>


  <script src="js/jquery-2.2.3.min.js"></script>
  <script type='text/javascript' src="js/bootstrap.min.js"></script>
  <script type='text/javascript' src="js/jquery.mycart.js"></script>
  <script type="text/javascript">
  $(function () {

    var goToCartIcon = function($addTocartBtn){
      var $cartIcon = $(".my-cart-icon");
      var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
      $addTocartBtn.prepend($image);
      var position = $cartIcon.position();
      $image.animate({
        top: position.top,
        left: position.left
      }, 500 , "linear", function() {
        $image.remove();
      });
    }

    $('.my-cart-btn').myCart({
      currencySymbol: '$',
      classCartIcon: 'my-cart-icon',
      classCartBadge: 'my-cart-badge',
      classProductQuantity: 'my-product-quantity',
      classProductRemove: 'my-product-remove',
      classCheckoutCart: 'my-cart-checkout',
      affixCartIcon: true,
      showCheckoutModal: true,
      numberOfDecimals: 2,
      cartItems: [
      ],
      clickOnAddToCart: function($addTocart){
        goToCartIcon($addTocart);
      },
      afterAddOnCart: function(products, totalPrice, totalQuantity) {
        console.log("afterAddOnCart", products, totalPrice, totalQuantity);
      },
      clickOnCartIcon: function($cartIcon, products, totalPrice, totalQuantity) {
        console.log("cart icon clicked", $cartIcon, products, totalPrice, totalQuantity);
      },
      checkoutCart: function(products, totalPrice, totalQuantity) {
        var checkoutString = "Total Price: " + totalPrice + "\nTotal Quantity: " + totalQuantity;
        checkoutString += "\n\n id \t name \t summary \t price \t quantity \t image path";
        $.each(products, function(){
          checkoutString += ("\n " + this.id + " \t " + this.name + " \t " + this.summary + " \t " + this.price + " \t " + this.quantity + " \t " + this.image);
        });
        alert(checkoutString)
        console.log("checking out", products, totalPrice, totalQuantity);
      },

    });

    $("#addNewProduct").click(function(event) {
      var currentElementNo = $(".row").children().length + 1;
      $(".row").append('<div class="col-md-3 text-center"><img src="images/img_empty.png" width="150px" height="150px"><br>product ' + currentElementNo + ' - <strong>$' + currentElementNo + '</strong><br><button class="btn btn-danger my-cart-btn" data-id="' + currentElementNo + '" data-name="product ' + currentElementNo + '" data-summary="summary ' + currentElementNo + '" data-price="' + currentElementNo + '" data-quantity="1" data-image="images/img_empty.png">Add to Cart</button><a href="#" class="btn btn-info">Details</a></div>')
    });
  });
  </script>


</body>
</html>
