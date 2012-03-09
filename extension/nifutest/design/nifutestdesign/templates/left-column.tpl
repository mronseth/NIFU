<!-- Content: START -->
{* {$pagedata.node_id} *}


{if eq($pagedata.node_id,ezini('NifuSettings', 'FrontPageID', 'nifutest.ini'))}
  <div class="left-column frontpage">
 {include uri="design:lc-frontpage.tpl"}
  </div>

{else}
  <div class="left-column">
  {include uri="design:lc-overall.tpl"}
  </div>
{/if}



 
<!-- Content: END -->
