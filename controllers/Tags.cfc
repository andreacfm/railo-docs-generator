component output="false"{

   function init(fw){
        variables.fw = fw;
        return this;
   }

   function search(rc){
        variables.fw.service('tags.filter', 'tags');
   }

   function view(rc){
       dump(rc);
       abort;
       var tagName = replace(rc.tag, "cf", "");
       rc.tagData = getTagData("cf", tagName);
   }

}

