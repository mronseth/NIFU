{def $current_node = fetch('content', 'node', hash('node_id', $pagedata.main_node_id))}

{* children of News main folder *}
{if $current_node.path_array.2|eq(ezini('NifuSettings', 'NewsID', 'nifutest.ini'))}

  {def $news_main = fetch('content', 'list', hash('parent_node_id', ezini('NifuSettings', 'NewsID', 'nifutest.ini')))}
  {if $news_main|count()}
    <ul>
        <li><a href={$news_main.0.parent.url|ezurl}>{$news_main.0.parent.name|wash()}</li>
      {foreach $news_main as $key => $news_item}
        <li><a href={$news_item.url|ezurl}>{$news_item.name}</a></li>
      {/foreach}
    </ul>
  {/if}


{* children of subs of top menu *}
{elseif $current_node.parent_node_id|eq(2)|not}

  {def $menu_node = fetch('content', 'list', hash('parent_node_id', $pagedata.main_node_id), 
                                                'class_filter_type', 'include', 
                                                'class_filter_array', array('documentation_page'))}
  {if $menu_node|count()}
    <ul>
      {foreach $menu_node as $key => $menu_item}
        <li><a href={$menu_item.url|ezurl}>{$menu_item.name}</a>
        
        {* user menu subs of subs *}
        {def $user_rightmenu_node = fetch('content', 'list', hash('parent_node_id', $menu_item.node_id),
                                      'class_filter_type', 'include',
                                      'class_filter_array', array('documentation_page'))}
        {if $user_rightmenu_node}
          <ul class="sub">
              {foreach $user_rightmenu_node as $sub_node}
                <li><a href={$sub_node.url|ezurl(,'full')}>{$sub_node.name|wash()}</a></li>
              {/foreach}
          </ul>
        {/if}
        
        </li>
      {/foreach}
    </ul>
  {/if}

{/if}



{* Sidebar AD *}
  {def $sidebar_ad=fetch( 'content', 'list', hash('parent_node_id', $current_node.path_array.2,
                                                'limit', 1,
                                                'class_filter_type', 'include',
                                                'class_filter_array', array('sidebar_ad_folder')))}

  {if $sidebar_ad}
    {def $current_ad = $sidebar_ad.0.children.0} 
      {if $current_ad|count()} 
      <div class="outer-head ad">
        <h2>{$current_ad.parent.name|wash()}</h2>
        <div class="box">
          {attribute_view_gui attribute=$current_ad.data_map.image image_class='currentFace'}
          <h3><a href={$current_ad.url|ezurl()}>{$current_ad.data_map.title.content}</a></h3>
          {$current_ad.data_map.intro.data_text}
        </div>
      </div>
      {/if}
    {undef $current_ad}
  {/if}

{undef $current_node}