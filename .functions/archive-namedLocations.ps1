param (
    [string]$clientId,
    [string]$clientSecret,
    [string]$templateName
)

$dateTime = get-date -Format yyyyMMdd
$archiveFile = ($dateTime + "-namedLocations.json")

function archiveNamedLocations {
    #$result = Invoke-RestMethod -Method Get -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/namedLocations') -Headers $headers -ContentType application/json
    $result = "test"
    return $result
}

$namedLocationsContent = archiveNamedLocations
add-content archive\$archiveFile -Value $namedLocationsContent
