<#import "template.ftl" as layout>
<#import "components/atoms/form.ftl" as form>
<#import "components/atoms/input.ftl" as input>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        Access Code Form
    <#elseif section = "header">
        Access Code Form
    <#elseif section = "form">
     <@form.kw action=url.loginAction method="post">
        <@input.kw label=msg("verificationCode") name="verificationCode" type="text" required=false />
        <input class="bg-primary-600 text-white focus:ring-primary-600 hover:bg-primary-700 px-4 py-2 text-sm relative rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2" value="${msg("doSubmit")}" name="login" type="submit"/>
        <input class="bg-primary-600 text-white focus:ring-primary-600 hover:bg-primary-700 px-4 py-2 text-sm relative rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2" value="${msg("resendCode")}" name="resend" type="submit"/>
        <input class="bg-primary-600 text-white focus:ring-primary-600 hover:bg-primary-700 px-4 py-2 text-sm relative rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2" value="${msg("doCancel")}" name="cancel" type="submit"/>
     </@form.kw>
    </#if>
</@layout.registrationLayout>