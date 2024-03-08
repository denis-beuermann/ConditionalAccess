param (
    [string]$clientId,
    [string]$clientSecret,
    [string]$templateName
)

function search {
    $search = $hash.displayName
    $result = Invoke-RestMethod -Method Get -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/policies?$filter=startswith(displayName,' + "'" + $search + "')") -Headers $headers -ContentType application/json
    return $result
}
function update {
    param(
        [string]$id
    )
    
    if ($hash.conditions.userRiskLevels -NotLike "")
    {
        $userRiskLevelsArray = try{$hash.conditions.userRiskLevels.split(',')}catch{$userRiskLevels = "[]"}
        if($userRiskLevelsArray.count -gt 1){
            $userRiskLevels = $hash.conditions.userRiskLevels | convertto-json
        }
        if($userRiskLevelsArray.count -eq 1){
            $userRiskLevels = ('["' + $hash.conditions.userRiskLevels + '"]')
        }
    }
    else {
            $userRiskLevels = "[]"
    }

    if ($hash.conditions.signInRiskLevels -NotLike "")
    {
        $signInRiskLevelsArray = $hash.conditions.signInRiskLevels.split(',')
        if($signInRiskLevelsArray.count -gt 1){
            $signInRiskLevels = $hash.conditions.signInRiskLevels | convertto-json
        }
        if($signInRiskLevelsArray.count -eq 1){
            $signInRiskLevels = ('["' + $hash.conditions.signInRiskLevels + '"]')
        }
    }
    else {
        $signInRiskLevels = "[]"
    }

    if ($hash.conditions.clientAppTypes -NotLike "")
    {
        $clientAppTypesArray = $hash.conditions.clientAppTypes.split(',')
        if($clientAppTypesArray.count -gt 1){
            $clientAppTypes = $hash.conditions.clientAppTypes | convertto-json
        }
        if($clientAppTypesArray.count -eq 1){
            $clientAppTypes = ('["' + $hash.conditions.clientAppTypes + '"]')
        }  
    }
    else {
        $clientAppTypes = "[]"
    }

    $updateRequest = '{
        "conditions":{
            "applications":
                '+ ($hash.conditions.applications | convertto-json) + ',
            "users": 
                '+ ($hash.conditions.users | convertto-json) +',
            "clientAppTypes":
                '+ ($clientAppTypes) + ',
            "devices": 
                '+ ($hash.conditions.devices | convertto-json) +',
            "locations":
                '+ ($hash.conditions.locations | convertto-json) +',
            "platforms": 
                '+ ($hash.conditions.platforms | convertto-json) +',
            "signInRiskLevels":
                '+ ($signinrisklevels) + ',
            "userRiskLevels":
                '+ ($userRiskLevels) +'
        }
    }'
    $response = Invoke-RestMethod -Method Patch -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/policies/' + $id) -Headers $headers -ContentType application/json -Body $updateRequest
    return $response
}

function updatePreview {
    param(
        [string]$id
    )
    
    if ($hash.conditions.userRiskLevels -NotLike "")
    {
        $userRiskLevelsArray = try{$hash.conditions.userRiskLevels.split(',')}catch{$userRiskLevels = "[]"}
        if($userRiskLevelsArray.count -gt 1){
            $userRiskLevels = $hash.conditions.userRiskLevels | convertto-json
        }
        if($userRiskLevelsArray.count -eq 1){
            $userRiskLevels = ('["' + $hash.conditions.userRiskLevels + '"]')
        }
    }
    else {
            $userRiskLevels = "[]"
    }

    if ($hash.conditions.signInRiskLevels -NotLike "")
    {
        $signInRiskLevelsArray = $hash.conditions.signInRiskLevels.split(',')
        if($signInRiskLevelsArray.count -gt 1){
            $signInRiskLevels = $hash.conditions.signInRiskLevels | convertto-json
        }
        if($signInRiskLevelsArray.count -eq 1){
            $signInRiskLevels = ('["' + $hash.conditions.signInRiskLevels + '"]')
        }
    }
    else {
        $signInRiskLevels = "[]"
    }

    if ($hash.conditions.clientAppTypes -NotLike "")
    {
        $clientAppTypesArray = $hash.conditions.clientAppTypes.split(',')
        if($clientAppTypesArray.count -gt 1){
            $clientAppTypes = $hash.conditions.clientAppTypes | convertto-json
        }
        if($clientAppTypesArray.count -eq 1){
            $clientAppTypes = ('["' + $hash.conditions.clientAppTypes + '"]')
        }  
    }
    else {
        $clientAppTypes = "[]"
    }

    $updateRequest = '{
        "state": '+ ($hash.state | convertto-json) + ',
        "conditions":{
            "applications":
                '+ ($hash.conditions.applications | convertto-json) + ',
            "users": 
                '+ ($hash.conditions.users | convertto-json) +',
            "clientAppTypes":
                '+ ($clientAppTypes) + ',
            "devices": 
                '+ ($hash.conditions.devices | convertto-json) +',
            "locations":
                '+ ($hash.conditions.locations | convertto-json) +',
            "platforms": 
                '+ ($hash.conditions.platforms | convertto-json) +',
            "signInRiskLevels":
                '+ ($signinrisklevels) + ',
            "userRiskLevels":
                '+ ($userRiskLevels) +'
        },
        "grantControls":
            '+ ($hash.grantControls | convertto-json) +' 

    }'
    $response = Invoke-RestMethod -Method Patch -Uri ('https://graph.microsoft.com/beta/identity/conditionalAccess/policies/' + $id) -Headers $headers -ContentType application/json -Body $updateRequest
    return $response
}
Function create{
    $response =Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/beta/identity/conditionalAccess/policies" -Headers $headers -Body $body -ContentType application/json
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

$searchResult = search

if($searchResult.value)
{
    $response = updatePreview $searchResult.value.id
    return $response
}
else
{
    $response = create
    return $response
}
$response