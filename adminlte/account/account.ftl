<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">${msg("changePasswordHtmlTitle")}</h3>
    </div>

    <form action="${url.accountUrl}" class="form-horizontal" method="post">
        <div class="box-body">
            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">
                    <div class="col-sm-2 col-md-2">
                        <label for="username" class="control-label">${msg("username")}</label> <#if realm.editUsernameAllowed><span class="required">*</span></#if>
                    </div>

                    <div class="col-sm-10 col-md-10">
                        <input type="text" class="form-control" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                    </div>
                </div>
            </#if>

            <div class="form-group ${messagesPerField.printIfExists('email','has-error')}">
                <div class="col-sm-2 col-md-2">
                <label for="email" class="control-label">${msg("email")}</label> <span class="required">*</span>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="email" name="email" autofocus value="${(account.email!'')}"/>
                </div>
            </div>

            <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">
                <div class="col-sm-2 col-md-2">
                    <label for="firstName" class="control-label">${msg("firstName")}</label> <span class="required">*</span>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
                </div>
            </div>

            <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">
                <div class="col-sm-2 col-md-2">
                    <label for="lastName" class="control-label">${msg("lastName")}</label> <span class="required">*</span>
                </div>

                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
                </div>
            </div>
        </div>
        <div class="box-footer">            
            <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>

            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">
            <i class="fa fa-undo"></i>&nbsp;
            ${msg("doCancel")}</button>

            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} pull-right" name="submitAction" value="Save">
            <i class="fa fa-save"></i>&nbsp;
            ${msg("doSave")}</button>
        </div>
    </form>
</div>

</@layout.mainLayout>