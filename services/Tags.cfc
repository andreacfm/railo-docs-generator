component{

    function filter(){
        var list = getTagList().cf;
        var tags = clean(StructKeyArray(list));
        var result = [];

        if(len(trim(criteria))){
            for(tag in tags){
                if(findNoCase(criteria, tag) eq 1){
                    result.add(tag);
                }
            }
         }else{
            result = tags;
        }

        ArraySort(result,'textnocase');
        return result;

    }


    private function clean(Array tags){
        for(tag in tags){
            if(find("_", tag)){
               ArrayDelete(tags, tag);
            }
        }
        return tags;
    }

}