## Define some services
##Define variables
#set ($null = $some-never-used-variable)

<div class="main-content">
    <div class="faq-wrap faq-wrap-not-active">
		<div class="faq-section">
			<h2>${faqSection.data}</h2>
			#if($faqSection.questions.size() > 0)
				<ul>
        			#foreach($question in $faqSection.questions.siblings)
						<li>
                            <div class="faq-question">
    							${question.data}
    						</div>
                            <div class="faq-answer">
    							${question.answer.data}
    						</div>
						</li>
    				#end
                </ul>
			#end
		</div>
    </div>
</div>