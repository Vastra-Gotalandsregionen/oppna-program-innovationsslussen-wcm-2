<#-- Define services -->
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.service.GroupLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") />
<#assign layoutSetLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutSetLocalService") />

<#-- Define some variables -->
<#assign urlPrefix =  getUrlPrefix(request) />

<#assign wrapCssClass = "info-tiles-wrap" />

<#assign wrapCssClass = wrapCssClass + " " + styling.skin.data />

<#if styling.adjustTopPortletMargin.data == "true">
  <#assign wrapCssClass = wrapCssClass + " adjust-top-portlet-margin" />
</#if>
<#if styling.adjustTopContentMargin.data == "true">
  <#assign wrapCssClass = wrapCssClass + " adjust-top-content-margin" />
</#if>


<div class="${wrapCssClass}">

    <div class="info-tiles-ctn">
        <div class="row-fluid">

        <#assign columnCssClass = "span12" />

        <#if tiles.siblings?size = 2>
            <#assign columnCssClass = "span6" />
        <#elseif tiles.siblings?size = 3>
            <#assign columnCssClass = "span4" />
        </#if>

        <#list tiles.siblings as tile>
            <#-- Only display 3 tiles --->
            <#if tile_index lte 2>

              <#assign linkUrl = tile.linkText.linkExternal.data />

        			<#if linkUrl == "">
                <#assign linkLayoutFriendlyUrl = getLayoutFriendlyUrl(tile.linkText.linkInternal) />
                <#if linkLayoutFriendlyUrl?has_content>
                  <#assign linkUrl = urlPrefix + linkLayoutFriendlyUrl />
                </#if>
        			</#if>
                <div class="tile ${columnCssClass}">
                    <div class="tile-content">
                      <h2>${tile.data}</h2>
                      <p>
                          ${tile.textContent.data}
                      </p>
                      <#if linkUrl?has_content>
                        <a class="link-btn link-btn-link" href="${linkUrl}">
                          <span>${tile.linkText.data}</span>
                        </a>
                      </#if>
                    </div>
                </div>
            </#if>
        </#list>

        </div>
    </div>
</div>

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
