<div class="project">
    <h1>
        ${name.data}
    </h1>
    <p class="intro">
        ${intro.data}
    </p>

    <#if image.data?has_content>
      <div class="image-wrap">
        <img src="${image.data}" alt="${name.data}" />
      </div>
    </#if>

    <div class="description">
        ${content.data}
    </div>
</div>
