<div class="main-content-article">

	<#if heading.data?has_content>
		<h1>${heading.data}</h1>
	</#if>

	<#if intro.data?has_content>
		<p class="intro">
			${intro.data}
		</p>
	</#if>

	<#if content.data?has_content>
		<div class="main-content-article-content">
			${content.data}
		</div>
	</#if>

</div>
