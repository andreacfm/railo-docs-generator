component{

    function filter(){
        var res = [];
        var list = getTagList().cf;
        var tags = StructKeyArray(list);
        ArraySort(tags,'textnocase');

        for(tag in tags){
            if(find("_", tag)){
                tags.remove(tag);
            }
        }

        if(len(trim(criteria))){
            for(tag in tags){
                if(findNoCase(criteria, tag) eq 1){
                    res.add(tag);
                }
            }
        }else{
            res = tags;
        }


        return tags;

    }

}