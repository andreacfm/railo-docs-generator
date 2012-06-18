<form id="searchForm">
    <input type="text" name="criteria"/>
</form>

<cfdiv bind="url:/index.cfm/tags/search/?criteria={searchForm:criteria}" id="result"/>


