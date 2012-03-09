    <!-- Top menu content: START -->
    <ul id="topmenu-firstlevel">
    
    {def $root_node=fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node) )
    
    
         $top_menu_items=fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
                                                        'sort_by', $root_node.sort_array,
                                                        'class_filter_type', 'include',
                                                        'class_filter_array', array('documentation_page')) ) 
         $top_menu_items_count = $top_menu_items|count()
         $item_class = array()
         
         $current_node_in_path = first_set($pagedata.path_array[1].node_id, 0  )}
         
         {* {$root_node.children.0|attribute('show', 2)} *}
         
    {if $top_menu_items_count}
       {foreach $top_menu_items as $key => $item}
            {set $item_class = cond($current_node_in_path|eq($item.node_id), array("selected"), array())}
            {if $key|eq(0)}
                {set $item_class = $item_class|append("firstli")}
            {/if}
            {if $top_menu_items_count|eq( $key|inc )}
                {set $item_class = $item_class|append("lastli")}
            {/if}
            {if $item.node_id|eq( $current_node_id )}
                {set $item_class = $item_class|append("current")}
            {/if}

            
                <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}>
                  <a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a>
                  
                  {* sub_menu list document_page *}
                  {def $sub_items=fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                          'sort_by', $item.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('documentation_page')) )}
                                                                          
                  <ul class="sub">
                     {*
{$item.children.0|attribute('show', 1)}
                      {break}
*}
                      {foreach $sub_items as $key => $subs}
                        <li><a href={$subs.url|ezurl(,'full')}>{$subs.name} {* $item.class_identifier *}</a></li>
                      {/foreach}
                  </ul>
                  
                  {undef $sub_items}
                  
                </li>
          {/foreach}
    {/if}
    {undef $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path}
    </ul>
    <!-- Top menu content: END -->