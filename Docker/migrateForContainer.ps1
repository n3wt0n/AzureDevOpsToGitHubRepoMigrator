#!/usr/bin/pwsh -Command

& "$PSScriptRoot\migrate.ps1" `
    -AzDOPAT $env:AZDOPAT `
    -AzDOOrg $env:AZDOORG `
    -AzDOPrj $env:AZDOPRJ `
    -AzDORepo $env:AZDOREPO `
    -GHPAT $env:GHPAT `
    -GHUser $env:GHUSER `
    -GHRepo $env:GHREPO `
    -Verbose