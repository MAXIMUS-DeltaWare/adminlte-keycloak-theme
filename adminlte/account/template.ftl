<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <#if referrer?has_content && referrer.url?has_content>
            <a href="${referrer.url}" class="logo">
        <#else>
            <a href="#" class="logo">
        </#if>
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini">${properties.logoMini?no_esc}</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">${properties.logoLarge?no_esc}</span>
        </a>

        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <#if realm.internationalizationEnabled>
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-globe"></i>&nbsp;${locale.current}</a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <#list locale.supported as l>
                                    <li><a href="${l.url}">${l.label}</a></li>
                                    </#list>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    </#if>
                        
                    <#if referrer?has_content && referrer.url?has_content>
                        <li><a href="${referrer.url}" id="referrer">${msg("backTo",referrer.name)}</a></li>
                    </#if>

                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>&nbsp;${account.username}</a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <li><a href="${url.logoutUrl}">${msg("doSignOut")}</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
    </header>


    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <section class="sidebar">
        <ul class="sidebar-menu tree" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li class="<#if active=='account'>active</#if>"><a href="${url.accountUrl}"><#if properties.iconAccount?has_content><i class="fa ${properties.iconAccount}"></i>&nbsp;</#if> ${msg("account")}</a></li>
            <#if features.passwordUpdateSupported><li class="<#if active=='password'>active</#if>"><a href="${url.passwordUrl}"><#if properties.iconPassword?has_content><i class="fa ${properties.iconPassword}"></i>&nbsp;</#if>${msg("password")}</a></li></#if>
            <li class="<#if active=='totp'>active</#if>"><a href="${url.totpUrl}"><#if properties.iconTotp?has_content><i class="fa ${properties.iconTotp}"></i>&nbsp;</#if>${msg("authenticator")}</a></li>
            <#if features.identityFederation><li class="<#if active=='social'>active</#if>"><a href="${url.socialUrl}">${msg("federatedIdentity")}</a></li></#if>
            <li class="<#if active=='sessions'>active</#if>"><a href="${url.sessionsUrl}"><#if properties.iconSessions?has_content><i class="fa ${properties.iconSessions}"></i>&nbsp;</#if>${msg("sessions")}</a></li>
            <li class="<#if active=='applications'>active</#if>"><a href="${url.applicationsUrl}"><#if properties.iconApplications?has_content><i class="fa ${properties.iconApplications}"></i>&nbsp;</#if>${msg("applications")}</a></li>
            <#if features.log><li class="<#if active=='log'>active</#if>"><a href="${url.logUrl}">${msg("log")}</a></li></#if>
            <#if realm.userManagedAccessAllowed && features.authorization><li class="<#if active=='authorization'>active</#if>"><a href="${url.resourceUrl}">${msg("myResources")}</a></li></#if>
        </ul>
        </section>
    </aside>

     <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-sm-9 content-area">
                <#if message?has_content>
                    <div class="alert alert-${message.type}">
                        <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
                        <#if message.type=='error' ><span class="pficon pficon-error-octagon"></span><span class="pficon pficon-error-exclamation"></span></#if>
                        ${kcSanitize(message.summary)?no_esc}
                    </div>
                </#if>

                <#nested "content">
            </div>
        </div>
  </div>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.13
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE</a>.</strong> All rights
    reserved.
</footer>

    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</body>
</html>
</#macro>