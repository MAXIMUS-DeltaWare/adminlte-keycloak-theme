<#import "template.ftl" as layout>
<@layout.mainLayout active='totp' bodyClass='totp'; section>

    <#if totp.enabled>
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">${msg("authenticatorTitle")}</h3>
        </div>
        <div class="box-body">
            <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th colspan="2">${msg("configureAuthenticators")}</th>
                    </tr>
                </thead>
            <tbody>
                <tr>
                    <td class="provider">${msg("mobile")}</td>
                    <td class="action">
                        <form action="${url.totpUrl}" method="post" class="form-inline">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <input type="hidden" id="submitAction" name="submitAction" value="Delete">
                            <button id="remove-mobile" class="btn btn-default"><i class="fa fa-trash"></i></button>
                        </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <#else>

<div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">${msg("authenticatorTitle")}</h3>
        </div>
        <div class="box-body">
            <ol>
                <li>
                    <p>${msg("totpStep1")?no_esc}</p>

                    <ul>
                        <#list totp.policy.supportedApplications as app>
                        <li>${app}</li>
                        </#list>
                    </ul>
                </li>

                <#if mode?? && mode = "manual">
                    <li>
                        <p>${msg("totpManualStep2")}</p>
                        <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                        <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("totpScanBarcode")}</a></p>
                    </li>
                    <li>
                        <p>${msg("totpManualStep3")}</p>
                        <ul>
                            <li id="kc-totp-type">${msg("totpType")}: ${msg("totp." + totp.policy.type)}</li>
                            <li id="kc-totp-algorithm">${msg("totpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                            <li id="kc-totp-digits">${msg("totpDigits")}: ${totp.policy.digits}</li>
                            <#if totp.policy.type = "totp">
                                <li id="kc-totp-period">${msg("totpInterval")}: ${totp.policy.period}</li>
                            <#elseif totp.policy.type = "hotp">
                                <li id="kc-totp-counter">${msg("totpCounter")}: ${totp.policy.initialCounter}</li>
                            </#if>
                        </ul>
                    </li>
                <#else>
                    <li>
                        <p>${msg("totpStep2")}</p>
                        <p><img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"></p>
                        <p><a href="${totp.manualUrl}" id="mode-manual">${msg("totpUnableToScan")}</a></p>
                    </li>
                </#if>
                <li>
                    <p>${msg("totpStep3")}</p>
                </li>
            </ol>

<hr/>

<form action="${url.totpUrl}" class="form-horizontal" method="post">
    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <div class="form-group">
            <div class="col-sm-2 col-md-2">
                <label for="totp" class="control-label">${msg("authenticatorCode")}</label>
                </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control" id="totp" name="totp" autocomplete="off" autofocus autocomplete="off">
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                </div>
            </div>
        </div>
    
        <div class="box-footer">
            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">
            <i class="fa fa-undo"></i>&nbsp;
            ${msg("doCancel")}</button>
            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} pull-right" name="submitAction" value="Save">
            <i class="fa fa-save"></i>&nbsp;
            ${msg("doSave")}</button>
        
        </div>
    </form>


    </div>
    </div>
    </#if>

</@layout.mainLayout>
