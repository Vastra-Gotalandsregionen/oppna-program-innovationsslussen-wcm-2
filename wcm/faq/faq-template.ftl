<div class="main-content">
  <div class="faq-wrap faq-wrap-not-active">
  		<div class="faq-section">

    			<h2>${faqSection.data}</h2>

          <#if faqSection.questions.siblings?size gt 0>
            <ul>
              <#list faqSection.questions.siblings as question>
                <li>
                  <div class="faq-question">
                     ${question.data}
                   </div>
                    <div class="faq-answer">
                       ${question.answer.data}
                     </div>
                 </li>
              </#list>
            </ul>
          </#if>

  		</div>
  </div>
</div>
