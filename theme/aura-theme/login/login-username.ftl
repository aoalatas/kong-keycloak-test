<#import "template.ftl" as layout>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<#import "components/atoms/checkbox.ftl" as checkbox>
<#import "components/atoms/form.ftl" as form>
<#import "components/atoms/input.ftl" as input>
<#import "components/atoms/link.ftl" as link>
<#import "components/molecules/identity-provider.ftl" as identityProvider>
<#import "features/labels/username.ftl" as usernameLabel>

<#assign usernameLabel><@usernameLabel.kw /></#assign>

<@layout.registrationLayout
  displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??
  displayMessage=!messagesPerField.existsError("username")
  ;
  section
>
  <#if section="header">
    <script>

      function setCookie(name,value,days) {
          var expires = "";
          if (days) {
              var date = new Date();
              date.setTime(date.getTime() + (days*24*60*60*1000));
              expires = "; expires=" + date.toUTCString();
          }
          document.cookie = name + "=" + (value || "")  + expires + "; path=/";
      }

      function getCookie(name) {
          var nameEQ = name + "=";
          var ca = document.cookie.split(';');
          for(var i=0;i < ca.length;i++) {
              var c = ca[i];
              while (c.charAt(0)==' ') c = c.substring(1,c.length);
              if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
          }
          return null;
      }

      function eraseCookie(name) {   
          document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
      }

      function getQueryStringParameterValue(param){
        var urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
      }

      function updateQueryStringParameterValue(uri, key, value) {
        var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
        var separator = uri.indexOf('?') !== -1 ? "&" : "?";
        if (uri.match(re)) {
          console.log(uri.replace(re, '$1' + key + "=" + value + '$2'));
          return uri.replace(re, '$1' + key + "=" + value + '$2');
        }
        else {
          console.log(uri + separator + key + "=" + value);
          return uri + separator + key + "=" + value;
        }
      }

      function removeHash() {
         var uri = window.location.toString();
         if (uri.indexOf("#") > 0) {
            var clean_uri = uri.substring(0, uri.indexOf("#"));
            if (window.history) {
              window.history.replaceState({}, document.title, clean_uri);
            } else {
              window.location.hash = '';
            }
         }
      }
      document.addEventListener("DOMContentLoaded", () => {
        var redirect_uri_param = 'redirect_uri';
    
        if (window.location.hash && window.location.hash != ''){
          var urlParams = new URLSearchParams(window.location.search);
          var redirectUri = urlParams.get(redirect_uri_param);
          var hashPart = window.location.hash;
          var encodedHashPart = encodeURIComponent(hashPart);
          var redirectedUrl = '/?rd=' + encodedHashPart;
          //var encodedRedirectedUrl = encodeURIComponent(redirectedUrl);
          var editedRedirectUri = redirectUri + redirectedUrl

          setCookie('HASH_PART', hashPart, 1);

          console.log("redirectUri : ", redirectUri);
          console.log("hashPart : ", hashPart);
          console.log("encodedHashPart : ", encodedHashPart);
          console.log("redirectedUrl : ", redirectedUrl);
          //console.log("encodedRedirectedUrl : ", encodedRedirectedUrl);
          console.log("editedRedirectUri : ", editedRedirectUri);

          
          //removeHash();
          //urlParams.set(redirect_uri_param, editedRedirectUri);

          //var newUrl = window.location.origin + window.location.pathname + '?' + urlParams.toString();          
          //history.replaceState(null, null, editedRedirectUri);
          window.location.href = editedRedirectUri;
        }        
      });
    </script>
    ${msg("loginAccountTitle")}
  <#elseif section="form">
    <#if realm.password>
      <@form.kw
        action=url.loginAction
        method="post"
        onsubmit="login.disabled = true; return true;" 
      >
        <#if !usernameHidden??>
          <@input.kw
            autocomplete=realm.loginWithEmailAllowed?string("email", "username")
            autofocus=true
            disabled=usernameEditDisabled??
            invalid=messagesPerField.existsError("username")
            label=usernameLabel
            message=kcSanitize(messagesPerField.get("username"))?no_esc
            name="username"
            type="text"
            value=(login.username)!''
          />
        </#if>
        <#if realm.rememberMe && !usernameHidden??>
          <div class="flex items-center justify-between">
            <@checkbox.kw
              checked=login.rememberMe??
              label=msg("rememberMe")
              name="rememberMe"
            />
          </div>
        </#if>
        <@buttonGroup.kw>
          <@button.kw color="primary" name="login" type="submit">
            ${msg("doLogIn")}
          </@button.kw>
        </@buttonGroup.kw>
      </@form.kw>
    </#if>
  <#elseif section="info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
      <div class="text-center">
        ${msg("noAccount")}
        <@link.kw color="primary" href=url.registrationUrl>
          ${msg("doRegister")}
        </@link.kw>
      </div>
    </#if>
  <#elseif section="socialProviders">
    <#if realm.password && social.providers??>
      <@identityProvider.kw providers=social.providers />
    </#if>
  </#if>
</@layout.registrationLayout>
