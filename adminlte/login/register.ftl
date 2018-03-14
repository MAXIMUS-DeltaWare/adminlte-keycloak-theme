<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
        <form id="kc-register-form" class="register form ${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">

          <#if !realm.registrationEmailAsUsername>
            <div class="register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" class="form-control ${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" />
                </div>
            </div>
          </#if>
            <div class="register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="form-control ${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" />
                </div>
            </div>

            <div class="register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="form-control ${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" />
                </div>
            </div>

            <div class="register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="form-control ${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" />
                </div>
            </div>

            <#if passwordRequired>
            <div class="register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password" class="form-control ${properties.kcInputClass!}" name="password" />
                </div>
            </div>

            <div class="register-field ${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" class="form-control ${properties.kcInputClass!}" name="password-confirm" />
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!} register-button-container">
                <div class="row">
                    <div id="kc-form-options" class="col-xs-5 ${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span>
                                <a class="btn btn-default btn-flat btn-block" href="${url.loginUrl}"><i class="fa fa-caret-left"></i>&nbsp;&nbsp;${msg("backToLogin")}</a>
                            </span>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="col-xs-7 ${properties.kcFormButtonsClass!}">
                        <input class="btn btn-primary btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
