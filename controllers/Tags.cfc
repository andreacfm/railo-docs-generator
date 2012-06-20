component output="false"{

   function init(fw){
        variables.fw = fw;
        return this;
   }

   function search(rc){
        request.layout = false;
        variables.fw.service('tags.filter', 'tags');
   }

   function view(rc){
       rc.tagData = getTagData("cf", replace(rc.tag, "cf", ""));
       rc.tagName = rc.tagData.namespace&rc.tagData.namespaceseperator&rc.tagData.name;
       if(rc.tagData.hasNameAppendix){
            rc.tagName = rc.tagName&="CustomName";
       }
       rc.arrAttrNames = StructKeyArray(rc.tagData.attributes);
       ArraySort(rc.arrAttrNames ,'textnocase');

       variables.fw.service('tags.intro', 'intro');
       variables.fw.service('tags.examples', 'examples');
    }

}

