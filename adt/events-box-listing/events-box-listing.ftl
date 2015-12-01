<#setting locale=locale>

<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<div class="event-box-listing content-box">

  <h2>
    Kalendarium
  </h2>

  <div class="content-box-bd">

    <#if entries?has_content>
      <div class="news-items">
        <#list entries as entry>

        <#assign assetRenderer = entry.getAssetRenderer() />
				<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />

				<#if assetLinkBehavior != "showFullContent">
					<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
				</#if>

        <#assign docXml = saxReaderUtil.read(entry.getAssetRenderer().getArticle().getContentByLocale(locale)) />
        <#assign itemEventName = docXml.valueOf("//dynamic-element[@name='eventName']/dynamic-content/text()") />
        <#assign itemDateStart = docXml.valueOf("//dynamic-element[@name='dateStart']/dynamic-content/text()") />
        <#assign itemDateStartDate = itemDateStart?number?long?number_to_datetime />
        <#assign itemTimeStart = docXml.valueOf("//dynamic-element[@name='timeStart']/dynamic-content/text()") />

        <#assign itemTimeEnd = docXml.valueOf("//dynamic-element[@name='timeStart']/dynamic-element[@name='timeEnd']/dynamic-content/text()") />

          <div class="entry-item">
            <a href="${viewURL}">

              <div class="entry-date">
                <div class="entry-date-inner">
                  <div class="entry-date-day">
                    ${itemDateStartDate?string("dd")}
                  </div>
                  <div class="entry-date-month">
                    ${itemDateStartDate?string("MMM")}
                  </div>
                </div>
              </div>

              <div class="entry-content">
                <div class="name">
                  ${itemEventName}
                </div>
                <#if itemTimeStart?has_content>
                  <div class="time">
                    <i class="icon-time"></i> ${itemTimeStart}
                    <#if itemTimeEnd?has_content>
                      &nbsp; - ${itemTimeEnd}
                    </#if>
                  </div>
                </#if>

              </div>

            </a>
          </div>

        </#list>
      </div>
    </#if>

  </div>

  <#if entries?has_content>
    <#assign entry = entries[0] />
    <#assign article = entry.getAssetRenderer().getArticle() />
    <#assign displayPageUuid = article.getLayoutUuid() />
    <#assign displayPage = layoutLocalService.fetchLayoutByUuidAndGroupId(displayPageUuid, group_id, page.isPrivateLayout())! />
    <#if displayPage?has_content>
      <#assign displayPageUrl = displayPage.getFriendlyURL(locale) />
      <div class="more-link-wrap">
        <a href="${displayPageUrl}" class="more-link">Fler event &raquo;</a>
      </div>
    </#if>
  </#if>

</div>

<#function ellipsis myString maxChars>
  <#if myString?length gt maxChars>
    <#return myString?substring(0, maxChars) + "..." />
  <#else>
    <#return myString />
  </#if>
</#function>
