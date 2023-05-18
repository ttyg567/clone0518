<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 구간  -->
<jsp:include page="/views/header.jsp" />

<!-- 상품의 상세내용 구간인 center -->


<section class="single-product">
  <div class="container">

    <div class="row">
      <div class="col-md-6">
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>
          <li><a href="/shop">Shop</a></li>
          <li class="active"><a href="/shop?category_id=${obj.category_id}">Product Category</a></li>
        </ol>
      </div>
    </div>

    <div class="row mt-20">
      <div class="col-md-5">
        <div class="single-product-slider">
          <div id='carousel-custom' class='carousel slide' data-ride='carousel'>
            <div class='carousel-outer'>
              <!-- 상품 이미지 slider -->
              <div class='carousel-inner '>
                <div class='item active'>
                  <img src="/img/${detail.product_imgname}" alt='' data-zoom-image=/img/${obj.product_imgname}" />
                </div>
                <div class='item'>
                  <img src="/img/${detail.product_detail_img1}" alt='' data-zoom-image="/img/${detail.product_detail_img1}" />
                </div>

                <div class='item'>
                  <img src="/img/${detail.product_detail_img2}" alt='' data-zoom-image="/img/${detail.product_detail_img2}" />
                </div>
                <div class='item'>
                  <img src="/img/${detail.product_detail_img3}" alt='' data-zoom-image="/img/${detail.product_detail_img3}" />
                </div>

              </div>

              <!-- sag sol -->
              <a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
                <i class="tf-ion-ios-arrow-left"></i>
              </a>
              <a class='right carousel-control' href='#carousel-custom' data-slide='next'>
                <i class="tf-ion-ios-arrow-right"></i>
              </a>
            </div>

            <!-- thumb -->
            <ol class='carousel-indicators mCustomScrollbar meartlab'>
              <li data-target='#carousel-custom' data-slide-to='0' class='active'>
                <img src="/img/${detail.product_imgname}" alt='' />
              </li>
              <li data-target='#carousel-custom' data-slide-to='1'>
                <img src="/img/${detail.product_detail_img1}" alt='' />
              </li>
              <li data-target='#carousel-custom' data-slide-to='2'>
                <img src="/img/${detail.product_detail_img2}" alt='' />
              </li>
              <li data-target='#carousel-custom' data-slide-to='3'>
                <img src="/img/${detail.product_detail_img3}" alt='' />
              </li>
            </ol>
          </div>
        </div>
      </div>
      <div class="col-md-7">
<%-- 장바구니에 추가하는 기능이 페이지에 있을 땐, from 태그와, input hidden이 꼭 있어야해  --%>
        <form id="cart_form" action="/addcart" method="get">
          <input type="hidden" name="user_id" value="${loginuser.user_id}"/>
          <input type="hidden" name="product_id" value="${detail.product_id}"/>
        <div class="single-product-details">
          <h2>${detail.product_name}</h2>
          <p class="product-description md-20">
            ${detail.product_contents}
          </p>
          <div class="product-price"><strong>
          <span>가격 : <span >${detail.product_price}</span></span>
          </strong></div><br>
          <div class="color-swatches">
           <span style="width: 200px"> ${detail.product_Material}</span>
          </div>
          <div class="product-size">
            <span>규격 : </span>
            <select class="form-control">
              <option>S</option>
              <option>M</option>
              <option>L</option>
              <option>XL</option>
            </select>
          </div>
          <div class="product-quantity">
            <span>수량 : </span>
            <div class="product-quantity-slider">
              <input type="number" class="form-control" id="cart_quantity" name="cart_quantity" placeholder="수량 선택" >
            </div>
          </div>
          <br>
          <br>
          <br>
          <%--  미로그인 고객 : 장바구니 담기 클릭 시 login 이동  --%>
          <%--  로그인 고객 : 장바구니 담기 클릭 시 cart로 자동 담김.  --%>
          <c:choose>
            <c:when test="${loginuser == null}">
               <a href="/login" class="btn btn-main btn-large"> 장바구니에 담기</a>
            </c:when>
            <c:otherwise>
                <button type="submit" class="btn btn-main default" id="cart_addbtn"> 장바구니에 담기</button>
            </c:otherwise>
          </c:choose>
        </div>
        </form>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="tabCommon mt-20">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#details" aria-expanded="true">Details</a></li>
            <li class=""><a data-toggle="tab" href="#reviews" aria-expanded="false">Reviews (3)</a></li>
          </ul>
          <div class="tab-content patternbg">
            <div id="details" class="tab-pane fade active in">
              <h4>Product Description</h4>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut per spici</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis delectus quidem repudiandae veniam distinctio repellendus magni pariatur molestiae asperiores animi, eos quod iusto hic doloremque iste a, nisi iure at unde molestias enim fugit, nulla voluptatibus. Deserunt voluptate tempora aut illum harum, deleniti laborum animi neque, praesentium explicabo, debitis ipsa?</p>
            </div>
            <div id="reviews" class="tab-pane fade">
              <div class="post-comments">
                <ul class="media-list comments-list m-bot-50 clearlist">
                  <!-- Comment Item start-->
                  <li class="media">

                    <a class="pull-left" href="#!">
                      <img class="media-object comment-avatar" src="images/blog/avater-1.jpg" alt="" width="50" height="50" />
                    </a>

                    <div class="media-body">
                      <div class="comment-info">
                        <h4 class="comment-author">
                          <a href="#!">Jonathon Andrew</a>

                        </h4>
                        <time datetime="2013-04-06T13:53">July 02, 2015, at 11:34</time>
                        <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
                      </div>

                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod laborum minima, reprehenderit laboriosam officiis praesentium? Impedit minus provident assumenda quae.
                      </p>
                    </div>

                  </li>
                  <!-- End Comment Item -->

                  <!-- Comment Item start-->
                  <li class="media">

                    <a class="pull-left" href="#!">
                      <img class="media-object comment-avatar" src="images/blog/avater-4.jpg" alt="" width="50" height="50" />
                    </a>

                    <div class="media-body">

                      <div class="comment-info">
                        <div class="comment-author">
                          <a href="#!">Jonathon Andrew</a>
                        </div>
                        <time datetime="2013-04-06T13:53">July 02, 2015, at 11:34</time>
                        <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
                      </div>

                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni natus, nostrum iste non delectus atque ab a accusantium optio, dolor!
                      </p>

                    </div>

                  </li>
                  <!-- End Comment Item -->

                  <!-- Comment Item start-->
                  <li class="media">

                    <a class="pull-left" href="#!">
                      <img class="media-object comment-avatar" src="images/blog/avater-1.jpg" alt="" width="50" height="50">
                    </a>

                    <div class="media-body">

                      <div class="comment-info">
                        <div class="comment-author">
                          <a href="#!">Jonathon Andrew</a>
                        </div>
                        <time datetime="2013-04-06T13:53">July 02, 2015, at 11:34</time>
                        <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
                      </div>

                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.
                      </p>

                    </div>

                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="products related-products section">
  <div class="container">
    <div class="row">
      <div class="title text-center">
        <h2>Related Products</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-md-3">
        <div class="product-item">
          <div class="product-thumb">
            <span class="bage">Sale</span>
            <img class="img-responsive" src="images/shop/products/product-5.jpg" alt="product-img" />
            <div class="preview-meta">
              <ul>
                <li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
                </li>
                <li>
                  <a href="#" ><i class="tf-ion-ios-heart"></i></a>
                </li>
                <li>
                  <a href="#!"><i class="tf-ion-android-cart"></i></a>
                </li>
              </ul>
            </div>
          </div>
          <div class="product-content">
            <h4><a href="product-single.html">Reef Boardsport</a></h4>
            <p class="price">$200</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/shop/products/product-1.jpg" alt="product-img" />
            <div class="preview-meta">
              <ul>
                <li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search-strong"></i>
									</span>
                </li>
                <li>
                  <a href="#" ><i class="tf-ion-ios-heart"></i></a>
                </li>
                <li>
                  <a href="#!"><i class="tf-ion-android-cart"></i></a>
                </li>
              </ul>
            </div>
          </div>
          <div class="product-content">
            <h4><a href="product-single.html">Rainbow Shoes</a></h4>
            <p class="price">$200</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/shop/products/product-2.jpg" alt="product-img" />
            <div class="preview-meta">
              <ul>
                <li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
                </li>
                <li>
                  <a href="#" ><i class="tf-ion-ios-heart"></i></a>
                </li>
                <li>
                  <a href="#!"><i class="tf-ion-android-cart"></i></a>
                </li>
              </ul>
            </div>
          </div>
          <div class="product-content">
            <h4><a href="product-single.html">Strayhorn SP</a></h4>
            <p class="price">$230</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/shop/products/product-3.jpg" alt="product-img" />
            <div class="preview-meta">
              <ul>
                <li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
                </li>
                <li>
                  <a href="#" ><i class="tf-ion-ios-heart"></i></a>
                </li>
                <li>
                  <a href="#!"><i class="tf-ion-android-cart"></i></a>
                </li>
              </ul>
            </div>
          </div>
          <div class="product-content">
            <h4><a href="product-single.html">Bradley Mid</a></h4>
            <p class="price">$200</p>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>



<!-- Modal -->
<div class="modal product-modal fade" id="product-modal">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <i class="tf-ion-close"></i>
  </button>
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div class="row">
          <div class="col-md-8">
            <div class="modal-image">
              <img class="img-responsive" src="images/shop/products/modal-product.jpg" />
            </div>
          </div>
          <div class="col-md-3">
            <div class="product-short-details">
              <h2 class="product-title">GM Pendant, Basalt Grey</h2>
              <p class="product-price">$200</p>
              <p class="product-short-description">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo laborum numquam rem aut officia dicta cumque.
              </p>
              <a href="#!" class="btn btn-main">Add To Cart</a>
              <a href="#!" class="btn btn-transparent">View Product Details</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>