<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="form reset-password ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="reset-password-field ${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" name="username" class="form-control ${properties.kcInputClass!}" autofocus/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} row">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!} col-xs-5">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span>
                            <a class="btn btn-default btn-flat btn-block" href="${url.loginUrl}"><i class="fa fa-caret-left"></i>&nbsp;&nbsp;${msg("backToLogin")}</a>
                        </span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} col-xs-7">
                    <input class="btn btn-primary btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        <hr />
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
