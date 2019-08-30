<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">${msg("sessionsHtmlTitle")}</h3>
    </div>
    <div class="box-body">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <td>${msg("ip")}</td>
                <td>${msg("started")}</td>
                <td>${msg("lastAccess")}</td>
                <td>${msg("expires")}</td>
                <td>${msg("clients")}</td>
            </tr>
            </thead>

            <tbody>
            <#list sessions.sessions as session>
                <tr>
                    <td>${session.ipAddress}</td>
                    <td>${session.started?datetime}</td>
                    <td>${session.lastAccess?datetime}</td>
                    <td>${session.expires?datetime}</td>
                    <td>
                        <#list session.clients as client>
                            ${client}<br/>
                        </#list>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
    <div class="box-footer">
        <form action="${url.sessionsUrl}" method="post">
            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
            <button id="logout-all-sessions" class="btn btn-danger">
            <i class="fa fa-sign-out"></i>&nbsp;
            ${msg("doLogOutAllSessions")}</button>
        </form>
    </div>
</div>
</@layout.mainLayout>
