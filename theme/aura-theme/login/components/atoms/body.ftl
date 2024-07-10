<#macro kw>
  <body class="bg-secondary-100 flex flex-col items-center justify-center min-h-screen sm:py-16" onload="fetchLogos()">
     <div class="dgpays-logo absolute">
          <img  src="${url.resourcesPath}/dist/assets/dgfin.svg" alt="Dgpays">
      </div>
      <div class="aura-logo">
          <img class="w-16" src="${url.resourcesPath}/dist/assets/aura-logo.svg" alt="Aura">
      </div>
    <#nested>
    <div class="text-center absolute bottom-0 text-white pb-4">
      <p class="dgpays-footer">© 2024 dgpays, Inc.</p>     
    </div>
  </body>
</#macro>
