component output="false"{

   function init(fw){
        variables.fw = fw;
        return this;
   }

   function search(rc){
        var list = getTagList().cf;
        var arr = StructKeyArray(list);
        ArraySort(arr,'textnocase');
        rc.tags = arr;
   }

   function view(rc){
       dump(rc);
       abort;
       var tagName = replace(rc.tag, "cf", "");
       rc.tagData = getTagData("cf", tagName);
   }

}

