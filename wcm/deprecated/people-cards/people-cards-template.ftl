<div class="persons-wrap">

	<#-- Multiple if's to prevent error for articles where heading is missing in structure -->
	<#if heading?has_content>
		<#if heading.data?has_content>
			<h2>${heading.data}</h2>
		</#if>
	</#if>

	<#if persons.siblings?size gt 0>

		<ul class="persons-list">

			<#list persons.siblings as person>

				<li>
					<div class="person">
						<div class="person-inner clearfix">
							<div class="person-image-ctn">
								<div class="person-image">
									<#if person.image.data?has_content>
										<img src="${person.image.data}" alt="${person.data}" />
									<#else>
										<span class="image-placeholder"></span>
									</#if>
								</div>
							</div>
							<div class="person-info-ctn">
								<div class="person-info">
									<#if person.data?has_content>
										<h3>
											${person.data}
											<#if person.nameExtra.data?has_content>
												<span>(${person.nameExtra.data})</span>
											</#if>
										</h3>
									</#if>

									<#if person.workTitle.data?has_content>
										<p>${person.workTitle.data}</p>
									</#if>
									<#if person.workOrganization.data?has_content>
										<p>${person.workOrganization.data}</p>
									</#if>
									<#if person.email.data?has_content>
										<p>
											<a href="mailto:${person.email.data}">${person.email.data}</a>
										</p>
									</#if>
									<#if person.phone.data?has_content>
										<p>Tel: ${person.phone.data}</p>
									</#if>
									<#if person.mobile.data?has_content>
										<p>Mob: ${person.mobile.data}</p>
									</#if>
								</div>
							</div>
						</div>
					</div>
				</li>

			</#list>

		</ul>

	</#if>

</div>
