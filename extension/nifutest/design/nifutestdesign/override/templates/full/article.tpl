<div class="section article">
  <h1>{$node.data_map.title.content|wash()}</h1>
  <div>
    {* {$node.data_map.body.object.related_contentobject_array.0.data_map.file.content|attribute('show', 1)} *}
    {attribute_view_gui attribute=$node.data_map.image image_class='articlemain'}
    {* {def $main_object = $node.object} *}
      <!-- <p class="date">{*$main_object.published|datetime('nifuDate')*}</p> -->
    {* {undef $main_object} *}
    <p><strong>{$node.data_map.intro.data_text}</strong></p>
    {if $node.data_map.body.content}
      <p>{$node.data_map.body.data_text}</p>
      {def $body_files = $node.data_map.body.object.related_contentobject_array}
        {if $body_files}
          <ul>
          {foreach $body_files as $key => $file_name}
            <li><a href={$file_name.data_map.file.content.filepath|ezroot()} target="_blank">{$file_name.name|wash()}</a></li>
          {/foreach}
          </ul>
        {/if}
      {undef $body_files}
    {/if}
  </div>
</div>