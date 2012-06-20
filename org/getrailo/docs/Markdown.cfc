component{

    function init(){
        variables.converter = createObject("java", "org.getrailo.docs.Markdown").init(expandPath("/javascripts/showdown.js"));
    }

    function toHtml(markdown){
        return clean(variables.converter.toHtml(markdown));
    }

    private function clean(text){
      return text;
    }

}