<div class="hero-carousel-ctn">
	<div class="hero-carousel">
  	<#list slides.siblings as slide>

				<div class="slide">



          <div class="content-area-wrap">
            <div class="container-fluid">
              <div class="content-area">
                <h2>${slide.data}</h2>
    	    			<p>${slide.textContent.data}</p>
    	    			<a class="link-btn link-btn-link" href="/">
    							<span>${slide.linkText.data}</span>
    						</a>
              </div>
            </div>
          </div>

          <img src="${slide.image.data}" alt="${slide.data}" />


					<#--
    			<div class="image-ctn">

    				<#if slide.image.data?has_content>
    					<img src="${slide.image.data}" alt="${slide.data}" />
    				</#if>

    			</div>

    			<div class="content-ctn">

	    			<h2>${slide.data}</h2>
	    			<p>${slide.textContent.data}</p>
	    			<a class="link-btn link-btn-link" href="/">
							<span>${slide.linkText.data}</span>
						</a>

    			</div>
				-->
				</div>

  	</#list>
	</div>

</div>
