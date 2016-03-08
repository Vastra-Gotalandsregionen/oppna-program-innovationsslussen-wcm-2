<#setting locale=locale>

<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<#assign summaryMaxChars = 200 />

<div class="projects-listing-wrap">

    <#if entries?has_content>
      <div class="projects-listing">
        <#list entries as entry>

        <#assign assetRenderer = entry.getAssetRenderer() />
				<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />

				<#if assetLinkBehavior != "showFullContent">
					<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
				</#if>

        <#--
          <#assign viewURL = viewURL + "?p_p_state=maximized" />
        -->

        <#assign docXml = saxReaderUtil.read(entry.getAssetRenderer().getArticle().getContentByLocale(locale)) />
        <#assign itemName = docXml.valueOf("//dynamic-element[@name='name']/dynamic-content/text()") />

        <#assign itemIntro = docXml.valueOf("//dynamic-element[@name='intro']/dynamic-content/text()") />
        <#assign itemIntro = ellipsis(itemIntro summaryMaxChars) />

        <#assign itemImageUrl = docXml.valueOf("//dynamic-element[@name='image']/dynamic-content/text()") />

        <div class="entry-item">

          <div class="entry-item-inner">
            <div class="image-wrap">
              <img src="${itemImageUrl}" alt="${itemName}" />
            </div>
            <div class="entry-item-content">
              <h2>
                ${itemName}
              </h2>

              <p>
                ${itemIntro}
              </p>

              <a class="link-btn link-btn-filled link-btn-link" href="${viewURL}">
                <span>L&auml;s mer</span>
              </a>
            </div>
          </div>

          </div>

        </#list>
      </div>
    </#if>

</div>

<#function ellipsis myString maxChars>
  <#if myString?length gt maxChars>
    <#return myString?substring(0, maxChars) + "..." />
  <#else>
    <#return myString />
  </#if>
</#function>
