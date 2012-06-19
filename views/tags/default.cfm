<form id="searchForm" class="well">
    <input type="text" name="criteria" class="span5" placeholder="Type something…"/>
</form>

<cfdiv bind="url:/index.cfm/tags/search/?criteria={searchForm:criteria@keyup}" id="searchResult"/>


