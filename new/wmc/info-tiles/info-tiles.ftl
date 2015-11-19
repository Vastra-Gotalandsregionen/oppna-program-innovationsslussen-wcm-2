<div class="info-tiles-wrap">
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
                <div class="tile ${columnCssClass}">
                    <h2>${tile.data}</h2>
                    <p>
                        ${tile.textContent.data}
                    </p>
                    <a class="link-btn link-btn-link" href="${tile.linkText.linkInternal.data}">
                      <span>${tile.linkText.data}</span>
                    </a>
                </div>
            </#if>
        </#list>

        </div>
    </div>
</div>
