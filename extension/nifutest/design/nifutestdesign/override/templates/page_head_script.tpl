{* Load JavaScript dependencys + JavaScriptList *}
{ezscript_load( array( ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ), ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' ) ) )}
<!-- for test -->
  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript"> 
    google.load("jquery", "1.5.1");
    google.load("jqueryui", "1.8.3");
  </script>
<script type="text/javascript" src={"javascript/commons.js"|ezdesign}></script> 