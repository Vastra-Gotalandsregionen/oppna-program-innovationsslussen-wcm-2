<#assign showMap = (streetAddress.data?has_content) && (zipCode.data?has_content) && (city.data?has_content) />

<#if showMap>
	<div class="map-container" data-title="${placeTitle.data}" data-streetaddress="${streetAddress.data}" data-zipcode="${zipCode.data}" data-city="${city.data}"></div>
</#if>
