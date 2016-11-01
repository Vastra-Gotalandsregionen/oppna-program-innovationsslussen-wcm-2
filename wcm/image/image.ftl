<#assign imageDataSplit = image.data?split("/") />
<#assign imageNameEscaped = imageDataSplit[4] />
<#assign imageName = httpUtil.decodePath(imageNameEscaped) />

<div class="image-wrap">
  <img src="${image.data}" alt="${imageName}" />
</div>
