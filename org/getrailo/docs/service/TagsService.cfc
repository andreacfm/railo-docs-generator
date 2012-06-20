component accessors="true"{

    property name="markdown";

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

    function intro(){
        var path = expandPath("/repo/tags/#arguments.tagName#/intro.md");
        return pathToHtml(path);
    }

    function examples(){
        var path = expandPath("/repo/tags/#arguments.tagName#/examples.md");
        return pathToHtml(path);
    }

    private function pathToHtml(path){
        if(fileExists(path)){
            res = getmarkdown().toHtml(fileRead(path));
        }
        return res;
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