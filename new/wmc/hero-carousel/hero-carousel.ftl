<#assign carouselWrapCssClass = "" />
<#if skin.data = "default">
	<#assign carouselWrapCssClass = "" />
<#elseif skin.data = "green">
	<#assign carouselWrapCssClass = "hero-carousel-wrap-green" />
<#elseif skin.data = "red">
	<#assign carouselWrapCssClass = "hero-carousel-wrap-red" />
</#if>

<div class="hero-carousel-wrap ${carouselWrapCssClass}">
    <div class="hero-carousel-ctn">
    	<div class="owl-carousel">
	    	<#list slides.siblings as slide>

	    		<div class="slide">

	    			<div class="image-ctn">

	    				<#if slide.image.data?has_content>
	    					<img src="${slide.image.data}" alt="${slide.data}" />
	    				</#if>

	    			</div>

	    			<div class="content-ctn">

		    			<h1>${slide.data}</h1>
		    			<p>${slide.textContent.data}</p>
		    			<a class="link-btn link-btn-link" href="/">
								<span>${slide.linkText.data}</span>
							</a>

	    			</div>

	    		</div>

	    	</#list>
    	</div>

    </div>
</div>
