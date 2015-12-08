<#setting locale=locale>

<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<#assign summaryMaxChars = 300 />

<div class="events-listing-wrap">

    <#if entries?has_content>
      <div class="event-listing">
        <#list entries as entry>

        <#assign assetRenderer = entry.getAssetRenderer() />
				<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />

				<#if assetLinkBehavior != "showFullContent">
					<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
				</#if>

        <#assign viewURL = viewURL + "?p_p_state=maximized" />

        <#assign docXml = saxReaderUtil.read(entry.getAssetRenderer().getArticle().getContentByLocale(locale)) />
        <#assign itemEventName = docXml.valueOf("//dynamic-element[@name='eventName']/dynamic-content/text()") />

        <#assign itemDateStart = docXml.valueOf("//dynamic-element[@name='dateStart']/dynamic-content/text()") />
        <#assign itemDateEnd = docXml.valueOf("//dynamic-element[@name='dateStart']/dynamic-element[@name='dateEnd']/dynamic-content/text()") />

        <#assign itemTimeStart = docXml.valueOf("//dynamic-element[@name='timeStart']/dynamic-content/text()") />
        <#assign itemTimeEnd = docXml.valueOf("//dynamic-element[@name='timeStart']/dynamic-element[@name='timeEnd']/dynamic-content/text()") />

        <#assign itemIntro = docXml.valueOf("//dynamic-element[@name='intro']/dynamic-content/text()") />
        <#assign itemTextContent = docXml.valueOf("//dynamic-element[@name='textContent']/dynamic-content/text()") />

        <div class="entry-item">

              <h2 class="entry-title">
                <a href="${viewURL}">
                  ${itemEventName}
                </a>
              </h2>

              <div class="meta-wrap">

                <#if itemDateStart?has_content>
                  <#assign dateString = itemDateStart?number?long?number_to_datetime?string("yyyy-MM-dd") />
                  <#if itemDateEnd?has_content>
                    <#assign dateString = dateString + " - " + itemDateEnd?number?long?number_to_datetime?string("yyyy-MM-dd") />
                  </#if>
                  <div class="meta-item date">
                    <i class="icon-calendar"></i> ${dateString}
                  </div>
                </#if>

                <#if itemTimeStart?has_content>
                  <#assign timeString = itemTimeStart />
                  <#if itemTimeEnd?has_content>
                    <#assign timeString = timeString + " - " + itemTimeEnd />
                  </#if>
                  <div class="meta-item time">
                    <i class="icon-time"></i> ${timeString}
                  </div>
                </#if>

              </div>

              <div class="entry-teaser">

                <#assign entrySummary = "" />
                <#if itemIntro?has_content>
                  <#assign entrySummary = itemIntro />
                <#else>
                  <#assign entrySummary = htmlUtil.escape(itemTextContent) />
                </#if>

                <#assign entrySummary = ellipsis(entrySummary summaryMaxChars) />

                <div class="entry-summary">
                  ${entrySummary}
                </div>
                <div class="entry-readmore">
                  <a class="link-btn link-btn-link" href="${viewURL}">
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
