<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">${msg("changePasswordHtmlTitle")}</h3>
    </div>

    <form action="${url.passwordUrl}" class="form-horizontal" method="post">
        <div class="box-body">
            <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

            <#if password.passwordSet>
                <div class="form-group">
                    <div class="col-sm-2 col-md-2">
                        <label for="password" class="control-label">${msg("password")}</label>
                    </div>

                    <div class="col-sm-10 col-md-10">
                        <input type="password" class="form-control" id="password" name="password" autofocus autocomplete="current-password">
                    </div>
                </div>
            </#if>

            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="password-new" class="control-label">${msg("passwordNew")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="password" class="form-control" id="password-new" name="password-new" autocomplete="new-password">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="password-confirm" class="control-label" class="two-lines">${msg("passwordConfirm")}</label>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="password" class="form-control" id="password-confirm" name="password-confirm" autocomplete="new-password">
                </div>
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} pull-right" name="submitAction" value="Save">
            <i class="fa fa-save"></i>&nbsp;
            ${msg("doSave")}</button>
        </div>
    </form>
</div>

    

</@layout.mainLayout>
