<#--
<#assign heroCarouselWrapCssClass = "" />
<#if slides.siblings?size gt 0>
	<#assign firstSkin = slides.siblings[0].skin.data />
	<#assign heroCarouselWrapCssClass = "hero-carousel-wrap-" + firstSkin />
</#if>
-->

<div class="hero-carousel-wrap">
    <div class="hero-carousel-ctn">
    	<div class="hero-carousel">
	    	<#list slides.siblings as slide>

						<div class="slide">

							<img src="${slide.image.data}" alt="${slide.data}" />

							<#--
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
						-->
						</div>

	    	</#list>
    	</div>

    </div>
</div>
