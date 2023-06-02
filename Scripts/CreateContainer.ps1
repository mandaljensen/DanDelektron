$containerName = 'my'
$credential = Get-Credential -Message 'Using UserPassword authentication. Please enter credentials for the container.'
$auth = 'UserPassword'
$artifactUrl = Get-BcArtifactUrl -type 'Sandbox' -country 'dk' -select 'Latest'
$licenseFile = 'Filer - Interne Dokumenter\Licenser\Latest.flf'
New-BcContainer `
    -accept_eula `
    -containerName $containerName `
    -credential $credential `
    -auth $auth `
    -artifactUrl $artifactUrl `
    -licenseFile $licenseFile `
    -dns '8.8.8.8' `
    -isolation 'hyperv' `
    -updateHosts