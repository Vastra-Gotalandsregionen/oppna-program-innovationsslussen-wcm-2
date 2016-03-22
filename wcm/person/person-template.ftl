<div class="info-card ${styling.skin.data}">
  <div class="info-card-hd">
    <h3 class="info-card-label phone">
      Kontakt
    </h3>
  </div>
  <div class="info-card-bd">
    <h3>${firstName.data} ${lastName.data}</h3>
    <#if workTitle.data?has_content>
      <div class="workt-title">
        ${workTitle.data}
      </div>
    </#if>
    <p class="contact-info contact-info-email">
      <a href="mailto:${email.data}">${email.data}</a>
    </p>
    <p class="contact-info contact-info-phone">
      ${phone.data}
    </p>
  </div>
</div>
