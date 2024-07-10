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
     <@form.kw
        action=url.loginAction
        method="post"
      >

        <@input.kw
          label=msg("verificitionCode")
          name="verificitionCode"
          type="text"
        />

        <@buttonGroup.kw>
          <@button.kw color="primary" name="login" type="submit" >${msg("doSubmit")}</@button.kw>
          <@button.kw color="primary" name="resend" type="submit" >${msg("resendCode")}</@button.kw>
          <@button.kw color="primary" name="cancel" type="submit" >${msg("doCancel")}</@button.kw>
        </@buttonGroup.kw>

         </@form.kw>
    </#if>
</@layout.registrationLayout>