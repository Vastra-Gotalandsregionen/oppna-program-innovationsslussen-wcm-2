<#-- Define services -->
<#assign dlFileEntryLocalService = serviceLocator.findService("com.liferay.portlet.documentlibrary.service.DLFileEntryLocalService") />

<#-- Define constants -->
<#assign documentNameMaxCharacters = 36 />

<div class="content-box content-box-tighter">

  <h2>
    ${heading.data}
  </h2>

  <div class="content-box-bd">

    <#if documents.siblings?size gt 0>
      <ul class="document-list">
        <#list documents.siblings as document>
          <#assign documentDataSplit = document.data?split("/") />

          <#-- Since we need to fetch dlFileEntry in order to get other data, we use name from file entry instead
          <#assign documentNameEscaped = documentDataSplit[4] />
          <#assign documentName = httpUtil.decodePath(documentNameEscaped) />
          -->

          <#assign documentGroupId = getterUtil.getLong(documentDataSplit[2]) />
          <#assign documentUuid = documentDataSplit[5] />

          <#assign documentDlFileEntry = dlFileEntryLocalService.getDLFileEntryByUuidAndGroupId(documentUuid, documentGroupId) />

          <#assign documentName = documentDlFileEntry.title />
          <#assign documentExtension = documentDlFileEntry.extension />

          <#assign documentCssClass = "link-icon link-icon-left link-icon-" + documentExtension  />

          <li>
            <a class="${documentCssClass}" href="${document.data}" title="${documentName}">
              ${ellipsis(documentName, documentNameMaxCharacters)}
            </a>
           </li>
        </#list>
      </ul>
    </#if>

  </div>

</div>

<#function ellipsis myString maxChars>
  <#if myString?length gt maxChars>
    <#return myString?substring(0, maxChars) + "..." />
  <#else>
    <#return myString />
  </#if>
</#function>
