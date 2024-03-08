param (
    [string]$clientId,
    [string]$clientSecret,
    [string]$templateName
)

function searchLocation {
    $search = $hash.displayName
    $result = Invoke-RestMethod -Method Get -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/namedLocations?$filter=startswith(displayName,' + "'" + $search + "')") -Headers $headers -ContentType application/json
    return $result
}

function backupLocation {
    $search = $hash.displayName
    $result = Invoke-RestMethod -Method Get -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/namedLocations?$filter=startswith(displayName,' + "'" + $search + "')") -Headers $headers -ContentType application/json
    return $result
}

function updateLocation {
    param(
        [string]$id
    )
    
    $response = Invoke-RestMethod -Method Patch -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/namedLocations/' + $id) -Headers $headers -ContentType application/json -Body $body
    return $response
}
Function createLocation{
    $response =Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/beta/identity/conditionalAccess/namedLocations" -Headers $headers -Body $body -ContentType application/json
    return $response
}

$tenantId = "77b89f9e-cf5c-4c4c-af28-7a4de6f60b90"
$authUri = "https://login.microsoft.com/$tenantId/OAuth2/v2.0/token"

$authBody = @{
    client_id = $clientId
    scope = "https://graph.microsoft.com/.default"
    client_secret = $clientSecret
    grant_type = "client_credentials"
}

$tokenRequest = Invoke-WebRequest -Method Post -Uri $authUri -ContentType "application/x-www-form-urlencoded" -Body $authBody -UseBasicParsing
$authToken = ($tokenRequest.Content | ConvertFrom-Json).access_token
$headers = @{'Authorization' = "Bearer $authToken"}

$body = Get-Content $templateName
$hash = $body | ConvertFrom-Json

$searchResult = searchLocation

if($searchResult.value)
{
    $response = updateLocation $searchResult.value.id
    return $response
}
else
{
    $response = createLocation
    return $response
}
$response