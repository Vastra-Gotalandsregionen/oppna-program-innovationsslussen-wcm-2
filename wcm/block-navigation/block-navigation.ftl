<#-- Define services -->
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.service.GroupLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") />
<#assign layoutSetLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutSetLocalService") />

<#assign currentPlid = 0 />
<#assign themeDisplay = request['theme-display']! />
<#if themeDisplay?has_content>
  <#assign plidStr = themeDisplay['plid']! />
  <#if plidStr?has_content>
      <#assign currentPlid = getterUtil.getLong(plidStr) />
  </#if>
</#if>

<#-- Define some variables -->
<#assign urlPrefix =  getUrlPrefix(request) />

<#if navItems.siblings?size gt 0>

  <nav class="block-navigation">
    <ul>
      <#list navItems.siblings as navItem>

        <#assign isCurrentPage = false />

        <#assign cssClass = "" />
        <#assign iconVal = navItem.icon.data />
        <#if iconVal != "none">
          <#assign cssClass = "ico" + " ico-" + iconVal />
        </#if>

        <#assign linkUrl = navItem.linkExternal.data />
        <#if linkUrl?has_content>
          <#if !(linkUrl?starts_with("http")) && !(linkUrl?starts_with("/"))>
            <#assign linkUrl = "//" + linkUrl />
          </#if>
        </#if>

        <#if linkUrl == "">
          <#assign linkLayoutFriendlyUrl = getLayoutFriendlyUrl(navItem.linkInternal) />
          <#if linkLayoutFriendlyUrl?has_content>
            <#assign linkUrl = urlPrefix + linkLayoutFriendlyUrl />
          </#if>
          <#assign linkLayout = getLayoutFromLinkToPage(navItem.linkInternal) />
          <#if linkLayout?has_content>
            <#if linkLayout.getPlid() == currentPlid>
              <#assign isCurrentPage = true />
            </#if>
          </#if>
        </#if>

        <#if isCurrentPage>
          <#assign cssClass = cssClass + " selected">
        </#if>

        <#if !isCurrentPage>
        </#if>
          <li class="${cssClass}">
            <a href="${linkUrl}">
              <span>
                ${navItem.data}
              </span>
            </a>
          </li>
        

      </#list>
    </ul>
  </nav>

</#if>




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

<#--
	Macro getLayoutFromLinkToPage
	Parameter linkToPage = an article structure element of the type LinkToPage
	Returns Layout
-->
<#function getLayoutFromLinkToPage linkToPage>

  <#local linkLayout = "" />

  <#if linkToPage.data?has_content>
  	<#local linkData = linkToPage.data?split("@") />

  	<#local linkLayoutId =  getterUtil.getLong(linkData[0]) />

  	<#local linkLayoutIsPrivate =  false />
  	<#if linkData[1] == "private">
  		<#local linkLayoutIsPrivate = true />
  	</#if>

  	<#local linkLayoutGroupId = getterUtil.getLong(linkData[2]) />

  	<#local linkLayout = layoutLocalService.getLayout(linkLayoutGroupId, linkLayoutIsPrivate, linkLayoutId) />

  </#if>

	<#return linkLayout />

</#function>
