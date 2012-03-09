<a href="/index.php/Nyheter">Nyheter</a>
{* Internal news content *}
{def $internal_content_list=fetch(
					'content',
					'list',
					hash( 'parent_node_id', ezini('NifuSettings', 'InterContentID', 'nifutest.ini') ),
					'class_filter_type', 'include',
					'sort_by', array( array( 'published', false() ) ),
					'limit', 5,
					'class_filter_array', array('article')
				)
}
{if $internal_content_list|count()|true()}
<div class="section">
  <h1>{$internal_content_list.0.parent.name}</h1>
  <div>
    {attribute_view_gui attribute=$internal_content_list.0.data_map.image image_class='currentFace'}
    {def $main_object = $internal_content_list.0.object}    
      <p class="date">{$main_object.published|datetime('nifuDate')}</p>
      <h1><a href={$internal_content_list.0.url|ezurl()}>{$internal_content_list.0.data_map.title.content}</a></h1>
      <p>{$internal_content_list.0.data_map.intro.data_text}</p>
    {undef $main_object}
  </div>
	{def $siblings=$internal_content_list|remove(0,1)}
    <ul>
		{foreach $siblings as $sibling}
			{def $sibling_object=$sibling.object}
        <li>
          <span class="date">{$sibling_object.published|datetime('nifuDate')}</span> 
          &nbsp;-&nbsp;
          <a href={$sibling.url|ezurl()}>{$sibling.data_map.intro.data_text}</a>
        </li>
			{undef $sibling_object}
		{/foreach}
		</ul>
	{undef $siblings}
</div>
{/if}
{undef $internal_content_list}

{* External news content *}
{def $external_content_list=fetch(
					'content',
					'list',
					hash( 'parent_node_id', ezini('NifuSettings', 'ExterContentID', 'nifutest.ini') ),
					'class_filter_type', 'include',
					'sort_by', array( array( 'published', false() ) ),
					'limit', 5,
					'class_filter_array', array('article')
				)
}

{if $external_content_list|count()|true()}
<div class="section">
  <h1>{$external_content_list.0.parent.name}</h1>
  <div>
    {attribute_view_gui attribute=$external_content_list.0.data_map.image image_class='currentFace'}
    {def $main_object = $external_content_list.0.object}    
      <p class="date">{$main_object.published|datetime('nifuDate')}</p>
      <h1><a href={$external_content_list.0.url|ezurl()}>{$external_content_list.0.data_map.title.content}</a></h1>
      <p>{$external_content_list.0.data_map.intro.data_text}</p>
    {undef $main_object}
  </div>
	{def $siblings=$external_content_list|remove(0,1)}
    <ul>
		{foreach $siblings as $sibling}
			{def $sibling_object=$sibling.object}
        <li>
          <span class="date">{$sibling_object.published|datetime('nifuDate')}</span> 
          &nbsp;-&nbsp;
          <a href={$sibling.url|ezurl()}>{$sibling.data_map.intro.data_text}</a>
        </li>
			{undef $sibling_object}
		{/foreach}
		</ul>
	{undef $siblings}
</div>
{/if}

{undef $external_content_list}                                                  
                                                                                                    
{* {$inter_content|attribute('show',1)}  *} 
{*

<div class="section">
  <h1>{$inter_content.0.parent.name}</h1>
  {def $contentObject = $inter_content.0.object}
  <div>
    <img src={$inter_content.0.data_map.image.content.currentFace.full_path} />
    
    <!-- <p class="date">{$contentObject.published|datetime('nifuDate')}</p> -->
    <h1><a href={$inter_content.0.url|ezurl()}>{$inter_content.0.data_map.title.content}</a></h1>
    
    <p>
      {$inter_content.0.data_map.intro.data_text}
    </p>
  </div>
  {undef $contentObject}
  {def $num_articles=$inter_content|count()}
    <ul>
    {for 0 to $num_articles as $index} 
      {def $contentObject = $inter_content.$index.object}
      <li>
        <!-- <span class="date">$contentObject.published|datetime('nifuDate')</span> - --> 
        <a href={$inter_content.$index.url|ezurl()}>{$inter_content.$index.data_map.title.content}</a>.
      </li>
      {undef $contentObject}
    {/for}
    </ul>
  {undef $num_articles}  
  <a class="more" href={$inter_content.0.parent.url|ezurl()}>Flere artikler og slikt</a>
</div>  

*}
{* Eksternt Innhold *}
