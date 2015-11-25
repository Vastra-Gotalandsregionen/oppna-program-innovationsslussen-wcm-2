<#assign namespace = request["portlet-namespace"]!>

<div class="event">
    <h1>${eventName.data}</h1>

      <div class="row-fluid">
        <div class="span8">
          <div class="column-content">

            <div class="meta-wrap">
              <#if dateStart.data?has_content>
                <div class="meta-item date">
                  <#assign startDate = dateStart.data?number?long?number_to_datetime?string("yyyy-MM-dd")>
                  <i class="icon-calendar"></i> ${startDate}
                  <#if dateStart.dateEnd.data?has_content>
                    <#assign endDate = dateStart.dateEnd.data?number?long?number_to_datetime?string("yyyy-MM-dd")>
                    &nbsp; - ${endDate}
                  </#if>
                </div>
              </#if>
              <#if timeStart.data?has_content>
                <div class="meta-item time">
                  <i class="icon-time"></i> ${timeStart.data}
                  <#if timeStart.timeEnd.data?has_content>
                    &nbsp; - ${timeStart.timeEnd.data}
                  </#if>
                </div>
              </#if>
              <#if location.data?has_content>
                <div class="meta-item location">
                  <i class="icon-map-marker"></i> ${location.data}
                </div>
              </#if>
            </div>

            <#if intro.data?has_content>
              <div class="intro">
                ${intro.data}
              </div>
            </#if>
            <div class="content">
              ${textContent.data}
            </div>


          </div>
        </div>
        <div class="span4">
          <div class="column-content">
            <#if registerURL.data?has_content>
              <div class="signup">
                <a class="link-btn link-btn-filled link-btn-link" href="${registerURL.data}" target="_BLANK">
                  <span>Anm&auml;l dig h&auml;r</span>
                </a>
              </div>

              <#assign showMap = (location.locationStreetaddress.data?has_content) && (location.locationZipcode.data?has_content) && (location.locationCity.data?has_content) />

              <#if showMap>
                <div class="map-container" data-title="${location.data}" data-streetaddress="${location.locationStreetaddress.data}" data-zipcode="${location.locationZipcode.data}" data-city="${location.locationCity.data}"></div>
              </#if>

            </#if>
          </div>
        </div>
      </div>

</div>
