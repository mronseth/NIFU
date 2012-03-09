  <!-- Content: START -->
  <ul id="usercontrol">
    {def $menu_items=fetch( 'content', 'list', hash( 'parent_node_id', ezini('NifuSettings', 'RightMenuID', 'nifutest.ini') ) )}
    {foreach $menu_items as $item}
      <li><a href={$item.url|ezurl()}>{$item.name|wash}</a></li>
      {*
{$item.data_map.location.content|attribute('show', 1)}
      {break}
*}
    {/foreach}
  </ul>
  
  
  {* Siste utlysninger *}
  {def $latestAd=fetch( 'content', 'list', hash( 'parent_node_id', ezini('NifuSettings', 'AdID', 'nifutest.ini'),
                                                'class_filter_type', 'include', 
                                                'sort_by', array(array('published', false())),
                                                'limit', 1, 
                                                'class_filter_array', array('article')) )}
  {if $latestAd|count()|eq(0)|not}
    {def $current_ad = $latestAd.0}
    <div class="outer-head">
      <h2>{$current_ad.parent.name}</h2>
      <div class="box">
        <h3>{$current_ad.data_map.title.content}</h3>
  
        <a href={$current_ad.url|ezurl()} class="ads">Les mer</a>
        <a href={$current_ad.parent.url|ezurl()} class="ads">Se alle utlysninger</a>
      </div>
    </div>
    {undef $current_ad}
  {/if}
  
{def $the_user=fetch( user, current_user )}
{if $the_user.is_logged_in}
  <div class="outer-head">
    <h2>Min status</h2>
    <div class="box">

      <ul>
        <li>Faktureringsmål: 1320</li>
        <li>Utfakturert til nå: 750</li>
        <li class="important">Flexitid: 5 timer</li>
      </ul>
    </div>
  </div>
{/if}
  <!-- Content: END -->