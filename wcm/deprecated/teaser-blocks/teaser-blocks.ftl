<#-- Define services -->
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.service.GroupLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") />
<#assign layoutSetLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutSetLocalService") />

<#-- Define some variables -->
<#assign urlPrefix =  getUrlPrefix(request) />


<div class="teaser-blocks">

  <#list teaserBlocks.siblings as block>

    <#assign linkUrl = "" />
    <#assign linkLayoutFriendlyUrl = getLayoutFriendlyUrl(block.linkText.linkInternal) />
    <#if linkLayoutFriendlyUrl?has_content>
      <#assign linkUrl = urlPrefix + linkLayoutFriendlyUrl />
    <#elseif block.linkText.linkExternal.data?has_content>
      <#assign linkUrl = block.linkText.linkExternal.data />
    </#if>

    <#if linkUrl?has_content>
      <a href="${linkUrl}" class="teaser-block">
        <@teaserContent block=block />
      </a>
    <#else>
      <div class="teaser-block">
        <@teaserContent block=block />
      </div>
    </#if>

  </#list>

</div>

<#macro teaserContent block>
  <div class="teaser-block-inner">
    <#if block.image.data?has_content>
      <div class="image-wrap">
        <img src="${block.image.data}" alt="${block.data}" />
      </div>
    </#if>
    <h2>
      ${block.data}
    </h2>
    <div class="teaser-block-content">
      ${block.textContent.data}
    </div>
  </div>
</#macro>


<#--
	Macro getUrlPrefix
	Parameter request = the request object for the freemarker context.
	Returns urlPrefix for links.
	If no virtual host exists then the urlPrefix will be for example on the form "/web/guest". Else urlPrefix will be blank
-->
<#function getUrlPrefix request>
	<#local urlPrefix = "" />

	<#local scopePlid =  getterUtil.getLong(request["theme-display"]["plid"]) />
	<#local scopeLayout =  layoutLocalService.getLayout(scopePlid) />
	<#local groupIdLong =  getterUtil.getLong(groupId) />
	<#local scopeGroup =  groupLocalService.getGroup(groupIdLong) />

	<#local scopeLayoutSet =  layoutSetLocalService.getLayoutSet(groupIdLong, scopeLayout.isPrivateLayout()) />
	<#local scopeLayoutSetVirtualHost = scopeLayoutSet.getVirtualHostname() />
	<#local hasVirtualHost =  false />

	<#if scopeLayoutSetVirtualHost != "">
		<#local hasVirtualHost =  true />
	</#if>

	<#if !hasVirtualHost>
		<#if scopeLayout.isPrivateLayout()>
			<#local urlPrefix =  "/group" />
		<#else>
			<#local urlPrefix =  "/web" />
		</#if>

		<#local urlPrefix =  urlPrefix + scopeGroup.getFriendlyURL() />
	</#if>

	<#return urlPrefix />
</#function>

<#--
	Macro getLayoutFriendlyUrl
	Parameter linkToPage = an article structure element of the type LinkToPage
	Returns friendlyURL for the link.
-->
<#function getLayoutFriendlyUrl linkToPage>

  <#local linkLayoutFriendlyUrl = "" />

  <#if linkToPage.data?has_content>
  	<#local linkData = linkToPage.data?split("@") />

  	<#local linkLayoutId =  getterUtil.getLong(linkData[0]) />

  	<#local linkLayoutIsPrivate =  false />
  	<#if linkData[1] == "private">
  		<#local linkLayoutIsPrivate = true />
  	</#if>

  	<#local linkLayoutGroupId = getterUtil.getLong(linkData[2]) />

  	<#local slideLinkLayout = layoutLocalService.getLayout(linkLayoutGroupId, linkLayoutIsPrivate, linkLayoutId) />

  	<#local linkLayoutFriendlyUrl = slideLinkLayout.friendlyURL />
  </#if>

	<#return linkLayoutFriendlyUrl />

</#function>
