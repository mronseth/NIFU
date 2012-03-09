  {* announcement *}
  {def $announce=fetch( 'content', 'list', hash( 'parent_node_id', ezini('NifuSettings', 'AnnounceID', 'nifutest.ini'),
                                                  'class_filter_type', 'include', 
                                                  'sort_by', array(array('published', false())),
                                                  'limit', 1, 
                                                  'class_filter_array', array('article')) )}
  
  {def $current_announce = $announce.0}
    {if $current_announce|count()|eq(0)|not}
    <div class="inner-head">
      <div class="box">
        <a href={$current_announce.url|ezurl()}><h1>{$current_announce.data_map.title.content}</h1></a>
        <p>{$current_announce.data_map.intro.data_text}</p>
      </div>
    </div>
    {/if}
  {undef $current_announce}
  
  
  {* Ukas ansikt *}
  {def $week_face=fetch( 'content', 'list', hash( 'parent_node_id', ezini('NifuSettings', 'FaceNode', 'nifutest.ini'),
                                                  'class_filter_type', 'include', 
                                                  'sort_by', array(array('published', false())),
                                                  'limit', 1, 
                                                  'class_filter_array', array('article')) )}
  
  {def $current_face = $week_face.0} 
    {if $current_face|count()|eq(0)|not} 
    <!-- 'sort_by', array(array('attribute', false(), 'article/publish_date')), -->                                                
    <div class="outer-head">
      <h2>{$current_face.parent.name|wash()}</h2>
      <div class="box">
        <a href={$current_face.url|ezurl()}>{attribute_view_gui attribute=$current_face.data_map.image image_class='currentFace'}</a>
        <h3 class="overlay">{$current_face.data_map.title.content}<span>Tips!</span></h3>
      </div>
    </div>
    {/if}
  {undef $current_face}
  
  
  
  {* Interne prosjekter *}
  {def $internal_pro=fetch( 'content', 'list', hash( 'parent_node_id', ezini('NifuSettings', 'ProjectNode', 'nifutest.ini'),
                                                  'class_filter_type', 'include', 
                                                  'sort_by', array(array('published', false())),
                                                  'limit', 1, 
                                                  'class_filter_array', array('article')) )}
  
  {def $current_pro = $internal_pro.0}
    {if $current_pro|count()|eq(0)|not}
    <div class="outer-head">
      <h2>{$current_pro.parent.name}</h2>
      <div class="box">
        <p>{$current_pro.data_map.intro.data_text}</p>
        <a href={$current_pro.parent.url|ezurl()} class="all">Se alle...</a>
      </div>
    </div>
    {/if}
  {undef $current_pro}
  