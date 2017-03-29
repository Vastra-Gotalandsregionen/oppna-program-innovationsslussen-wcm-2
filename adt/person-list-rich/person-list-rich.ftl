<#setting locale=locale>

<#assign liferay_ui = taglibLiferayHash["/WEB-INF/tld/liferay-ui.tld"] />
<#assign liferay_util = taglibLiferayHash["/WEB-INF/tld/liferay-util.tld"] />

<#assign liferay_portlet = taglibLiferayHash["/WEB-INF/tld/liferay-portlet.tld"] />

<div class="person-listing-rich">

    <#if entries?has_content>
      <#list entries as entry>

        <#assign docXml = saxReaderUtil.read(entry.getAssetRenderer().getArticle().getContentByLocale(locale)) />
        <#assign firstName = docXml.valueOf("//dynamic-element[@name='firstName']/dynamic-content/text()") />
        <#assign lastName = docXml.valueOf("//dynamic-element[@name='lastName']/dynamic-content/text()") />
        <#assign unit = docXml.valueOf("//dynamic-element[@name='unit']/dynamic-content/text()") />
        <#assign workTitle = docXml.valueOf("//dynamic-element[@name='workTitle']/dynamic-content/text()") />
        <#assign phone = docXml.valueOf("//dynamic-element[@name='phone']/dynamic-content/text()") />
        <#assign email = docXml.valueOf("//dynamic-element[@name='email']/dynamic-content/text()") />
        <#assign imageSrc = docXml.valueOf("//dynamic-element[@name='image']/dynamic-content/text()") />
        <#assign description = docXml.valueOf("//dynamic-element[@name='description']/dynamic-content/text()") />

        <#if !imageSrc?has_content>
          <#assign imageSrc = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" />
        </#if>

        <#assign personInfo = firstName + " " + lastName />
        <#if unit?has_content>
          <#assign personInfo = personInfo + ", " + unit />
        </#if>

        <div class="person">

          <div class="person-image">
            <img src="${imageSrc}" alt="${firstName} ${lastName}" />
          </div>
          <div class="person-info">
            <h2>
              ${personInfo}
            </h2>
            <#if workTitle?has_content>
              <div class="person-worktitle">
                ${workTitle}
              </div>
            </#if>
            <div class="person-description">
              ${description}
            </div>
            <div class="person-contact">
              <#if email?has_content>
                <div class="person-contact-method">
                  <i class="icon-envelope-alt"></i> <a href="mailto:${email}">${email}</a>
                </div>
              </#if>
              <#if phone?has_content>
                <div class="person-contact-method">
                  <i class="icon-phone"></i> <span>${phone}</span>
                </div>
              </#if>
            </div>
          </div>

        </div>

      </#list>
    </#if>

</div>

<#function ellipsis myString maxChars>
  <#if myString?length gt maxChars>
    <#return myString?substring(0, maxChars) + "..." />
  <#else>
    <#return myString />
  </#if>
</#function>
