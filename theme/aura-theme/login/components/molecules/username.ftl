<#import "/components/atoms/link.ftl" as link>

<#macro kw linkHref="" linkTitle="" name="">
  <div class="flex items-center justify-center mb-4 space-x-2 justify-start">
    <div >
      <img  src="${url.resourcesPath}/dist/assets/avatar-empty.svg" alt=${name}>
    </div>
    <span class="font-medium pl-2">${name}</span>
  </div>
</#macro>
