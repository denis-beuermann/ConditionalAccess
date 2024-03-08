param (
    [string]$clientId,
    [string]$clientSecret,
    [string]$templateName
)

$dateTime = get-date -Format yyyyMMdd
$archiveFile = ($dateTime + "-conditionalAccessPolicies.json")

function archiveConditionalAccessPolicy {
    #$result = Invoke-RestMethod -Method Get -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/namedLocations') -Headers $headers -ContentType application/json
    $result = "test"
    return $result
}

$conditionalAccessPolicyContent = archiveConditionalAccessPolicy
add-content archive\$archiveFile -Value $conditionalAccessPolicyContent